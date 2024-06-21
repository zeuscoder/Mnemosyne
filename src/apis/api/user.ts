import { get } from '@/utils/methods'
import type { UserRequest } from '../types/user.d'

export function userRequest(params: UserRequest) {
  return get('/api', { params }) //测试接口
}
