## Springboot S2I example

Give jenkins sa access to `vpogu-springboot` project

```bash
oc policy add-role-to-user edit system:serviceaccount:jenkins:jenkins -n vpogu-springboot
```
