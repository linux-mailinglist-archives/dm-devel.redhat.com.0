Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B007760AA8
	for <lists+dm-devel@lfdr.de>; Tue, 25 Jul 2023 08:43:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690267408;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SkNWbveoRAFz+OdDX/e4KPPFDGaCyp8/LoVhhLN+OKY=;
	b=bofodhRkV/EoGIEAzSJfiOowHbfBmZOo6zApQCvt27AMzSax93ObBZQkMs6f/3yCMJQn00
	YxsoGQtJaX1y4DcORAYRTaUPtBv11ce1GFZzsaQ91wBKxLizVjRwvjGVIyk7glM7d97j6f
	xcjwUTYBLXaCTllBxIGErTlaSPtof3A=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-NxkuOnTQO2CgTIMMttcwjA-1; Tue, 25 Jul 2023 02:43:20 -0400
X-MC-Unique: NxkuOnTQO2CgTIMMttcwjA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE93A381BE1B;
	Tue, 25 Jul 2023 06:42:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B46C6C2C858;
	Tue, 25 Jul 2023 06:42:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D7CB41949758;
	Tue, 25 Jul 2023 06:42:52 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CF6E71946588
 for <dm-devel@listman.corp.redhat.com>; Mon, 24 Jul 2023 09:45:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 88282C2C856; Mon, 24 Jul 2023 09:45:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 805D5C2C7D3
 for <dm-devel@redhat.com>; Mon, 24 Jul 2023 09:45:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 440221C09040
 for <dm-devel@redhat.com>; Mon, 24 Jul 2023 09:45:10 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-omBFpkSgNMG5SjRvG24zxQ-1; Mon, 24 Jul 2023 05:45:08 -0400
X-MC-Unique: omBFpkSgNMG5SjRvG24zxQ-1
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1bba9539a23so639055ad.1
 for <dm-devel@redhat.com>; Mon, 24 Jul 2023 02:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690191907; x=1690796707;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GhsBT9Fumj8uBYrifNTbdeUWiupPg7k66ZIkdolEOus=;
 b=bKRsoo9m8D6DgIjrpLflaGcDLp8XfFdOjRMlMyJGZLVpflRQzrU+YZhfk3cpsjJuEy
 FEPW4D521fgTPzmSlue9ZtgrcBkPkc/SWAZwGw3CeCwXPzfnMhwFxTaqm5PNYPwGAA1b
 7tku3WZ6zIBrZ/ILnZSOHtoCklCAiQS09/de5YHVtTfKOpbLtalrm/oDAlS2EcGqo45e
 ajKsFiZZCQ0N/A01Mh3lvo1GuQvoApi/3i0fyGT9S6w6Ay9654m/UInTLCHRoo6uVxnD
 RRLkw6qBYFpgvAB/d7REqCnjVkjHLE0Dih9ceR0OnB26JJ4y/hr90CqPJmM0nS5YgfpS
 Q36w==
X-Gm-Message-State: ABy/qLZW3AQO2sD0GbQNg1Kv7VhpXZp2VnvPP30L8O7F27Uu1ilPwR/M
 UJi8eBEjzy5ZeBIJd2OdrQJO4w==
X-Google-Smtp-Source: APBJJlG2lKEMpVGWAV6dsRZ28hllsUFknqcdUwpJ+mz8ptX/BQjWY5s2WSDY0Jqf92PnyDAdPtn/0A==
X-Received: by 2002:a17:902:ea01:b0:1bb:83ec:832 with SMTP id
 s1-20020a170902ea0100b001bb83ec0832mr8326265plg.2.1690191906857; 
 Mon, 24 Jul 2023 02:45:06 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:45:06 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 17:43:07 +0800
Message-Id: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Tue, 25 Jul 2023 06:42:42 +0000
Subject: [dm-devel] [PATCH v2 00/47] use refcount+RCU method to implement
 lockless slab shrink
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

1. Background
=============

We used to implement the lockless slab shrink with SRCU [1], but then kernel
test robot reported -88.8% regression in stress-ng.ramfs.ops_per_sec test
case [2], so we reverted it [3].

This patch series aims to re-implement the lockless slab shrink using the
refcount+RCU method proposed by Dave Chinner [4].

[1]. https://lore.kernel.org/lkml/20230313112819.38938-1-zhengqi.arch@bytedance.com/
[2]. https://lore.kernel.org/lkml/202305230837.db2c233f-yujie.liu@intel.com/
[3]. https://lore.kernel.org/all/20230609081518.3039120-1-qi.zheng@linux.dev/
[4]. https://lore.kernel.org/lkml/ZIJhou1d55d4H1s0@dread.disaster.area/

2. Implementation
=================

Currently, the shrinker instances can be divided into the following three types:

a) global shrinker instance statically defined in the kernel, such as
   workingset_shadow_shrinker.

b) global shrinker instance statically defined in the kernel modules, such as
   mmu_shrinker in x86.

c) shrinker instance embedded in other structures.

For case a, the memory of shrinker instance is never freed. For case b, the
memory of shrinker instance will be freed after synchronize_rcu() when the
module is unloaded. For case c, the memory of shrinker instance will be freed
along with the structure it is embedded in.

In preparation for implementing lockless slab shrink, we need to dynamically
allocate those shrinker instances in case c, then the memory can be dynamically
freed alone by calling kfree_rcu().

This patchset adds the following new APIs for dynamically allocating shrinker,
and add a private_data field to struct shrinker to record and get the original
embedded structure.

1. shrinker_alloc()
2. shrinker_free_non_registered()
3. shrinker_register()
4. shrinker_unregister()

In order to simplify shrinker-related APIs and make shrinker more independent of
other kernel mechanisms, this patchset uses the above APIs to convert all
shrinkers (including case a and b) to dynamically allocated, and then remove all
existing APIs. This will also have another advantage mentioned by Dave Chinner:

```
The other advantage of this is that it will break all the existing out of tree
code and third party modules using the old API and will no longer work with a
kernel using lockless slab shrinkers. They need to break (both at the source and
binary levels) to stop bad things from happening due to using uncoverted
shrinkers in the new setup.
```

Then we free the shrinker by calling kfree_rcu(), and use rcu_read_{lock,unlock}()
to ensure that the shrinker instance is valid. And the shrinker::refcount
mechanism ensures that the shrinker instance will not be run again after
unregistration. So the structure that records the pointer of shrinker instance
can be safely freed without waiting for the RCU read-side critical section.

In this way, while we implement the lockless slab shrink, we don't need to be
blocked in unregister_shrinker() to wait RCU read-side critical section.

PATCH 1: move shrinker-related code into a separate file
PATCH 2: remove redundant shrinker_rwsem in debugfs operations
PATCH 3: add infrastructure for dynamically allocating shrinker
PATCH 4 ~ 21: dynamically allocate the shrinker instances in case a and b
PATCH 22 ~ 40: dynamically allocate the shrinker instances in case c
PATCH 41: remove old APIs
PATCH 42: introduce pool_shrink_rwsem to implement private synchronize_shrinkers()
PATCH 43: add a secondary array for shrinker_info::{map, nr_deferred}
PATCH 44 ~ 45: implement the lockless slab shrink
PATCH 46 ~ 47: convert shrinker_rwsem to mutex

3. Testing
==========

3.1 slab shrink stress test
---------------------------

We can reproduce the down_read_trylock() hotspot through the following script:

```

DIR="/root/shrinker/memcg/mnt"

do_create()
{
    mkdir -p /sys/fs/cgroup/memory/test
    echo 4G > /sys/fs/cgroup/memory/test/memory.limit_in_bytes
    for i in `seq 0 $1`;
    do
        mkdir -p /sys/fs/cgroup/memory/test/$i;
        echo $$ > /sys/fs/cgroup/memory/test/$i/cgroup.procs;
        mkdir -p $DIR/$i;
    done
}

do_mount()
{
    for i in `seq $1 $2`;
    do
        mount -t tmpfs $i $DIR/$i;
    done
}

do_touch()
{
    for i in `seq $1 $2`;
    do
        echo $$ > /sys/fs/cgroup/memory/test/$i/cgroup.procs;
        dd if=/dev/zero of=$DIR/$i/file$i bs=1M count=1 &
    done
}

case "$1" in
  touch)
    do_touch $2 $3
    ;;
  test)
    do_create 4000
    do_mount 0 4000
    do_touch 0 3000
    ;;
  *)
    exit 1
    ;;
esac
```

Save the above script, then run test and touch commands. Then we can use the
following perf command to view hotspots:

perf top -U -F 999

1) Before applying this patchset:

  40.44%  [kernel]            [k] down_read_trylock
  17.59%  [kernel]            [k] up_read
  13.64%  [kernel]            [k] pv_native_safe_halt
  11.90%  [kernel]            [k] shrink_slab
   8.21%  [kernel]            [k] idr_find
   2.71%  [kernel]            [k] _find_next_bit
   1.36%  [kernel]            [k] shrink_node
   0.81%  [kernel]            [k] shrink_lruvec
   0.80%  [kernel]            [k] __radix_tree_lookup
   0.50%  [kernel]            [k] do_shrink_slab
   0.21%  [kernel]            [k] list_lru_count_one
   0.16%  [kernel]            [k] mem_cgroup_iter

2) After applying this patchset:

  60.17%  [kernel]           [k] shrink_slab
  20.42%  [kernel]           [k] pv_native_safe_halt
   3.03%  [kernel]           [k] do_shrink_slab
   2.73%  [kernel]           [k] shrink_node
   2.27%  [kernel]           [k] shrink_lruvec
   2.00%  [kernel]           [k] __rcu_read_unlock
   1.92%  [kernel]           [k] mem_cgroup_iter
   0.98%  [kernel]           [k] __rcu_read_lock
   0.91%  [kernel]           [k] osq_lock
   0.63%  [kernel]           [k] mem_cgroup_calculate_protection
   0.55%  [kernel]           [k] shrinker_put
   0.46%  [kernel]           [k] list_lru_count_one

We can see that the first perf hotspot becomes shrink_slab, which is what we
expect.

3.2 registeration and unregisteration stress test
-------------------------------------------------

Run the command below to test:

stress-ng --timeout 60 --times --verify --metrics-brief --ramfs 9 &

1) Before applying this patchset:

setting to a 60 second run per stressor
dispatching hogs: 9 ramfs
stressor       bogo ops real time  usr time  sys time   bogo ops/s     bogo ops/s
                          (secs)    (secs)    (secs)   (real time) (usr+sys time)
ramfs            735238     60.00     12.37    363.70     12253.05        1955.08
for a 60.01s run time:
   1440.27s available CPU time
     12.36s user time   (  0.86%)
    363.70s system time ( 25.25%)
    376.06s total time  ( 26.11%)
load average: 10.79 4.47 1.69
passed: 9: ramfs (9)
failed: 0
skipped: 0
successful run completed in 60.01s (1 min, 0.01 secs)

2) After applying this patchset:

setting to a 60 second run per stressor
dispatching hogs: 9 ramfs
stressor       bogo ops real time  usr time  sys time   bogo ops/s     bogo ops/s
                          (secs)    (secs)    (secs)   (real time) (usr+sys time)
ramfs            746677     60.00     12.22    367.75     12443.70        1965.13
for a 60.01s run time:
   1440.26s available CPU time
     12.21s user time   (  0.85%)
    367.75s system time ( 25.53%)
    379.96s total time  ( 26.38%)
load average: 8.37 2.48 0.86
passed: 9: ramfs (9)
failed: 0
skipped: 0
successful run completed in 60.01s (1 min, 0.01 secs)

We can see that the ops/s has hardly changed.

This series is based on next-20230711, and the [PATCH v2 05/49] depends on the
patch: https://lore.kernel.org/lkml/20230625154937.64316-1-qi.zheng@linux.dev/.

Comments and suggestions are welcome.

Thanks,
Qi

Changelog in v1 -> v2:
 - implement the new APIs and convert all shrinkers to use it.
   (suggested by Dave Chinner)
 - fix UAF in PATCH [05/29] (pointed by Steven Price)
 - add a secondary array for shrinker_info::{map, nr_deferred}
 - re-implement the lockless slab shrink
   (Since unifying the processing of global and memcg slab shrink needs to
    modify the startup sequence (As I mentioned in https://lore.kernel.org/lkml/38b14080-4ce5-d300-8a0a-c630bca6806b@bytedance.com/),
    I finally choose to process them separately.)
 - collect Acked-bys

Qi Zheng (47):
  mm: vmscan: move shrinker-related code into a separate file
  mm: shrinker: remove redundant shrinker_rwsem in debugfs operations
  mm: shrinker: add infrastructure for dynamically allocating shrinker
  kvm: mmu: dynamically allocate the x86-mmu shrinker
  binder: dynamically allocate the android-binder shrinker
  drm/ttm: dynamically allocate the drm-ttm_pool shrinker
  xenbus/backend: dynamically allocate the xen-backend shrinker
  erofs: dynamically allocate the erofs-shrinker
  f2fs: dynamically allocate the f2fs-shrinker
  gfs2: dynamically allocate the gfs2-glock shrinker
  gfs2: dynamically allocate the gfs2-qd shrinker
  NFSv4.2: dynamically allocate the nfs-xattr shrinkers
  nfs: dynamically allocate the nfs-acl shrinker
  nfsd: dynamically allocate the nfsd-filecache shrinker
  quota: dynamically allocate the dquota-cache shrinker
  ubifs: dynamically allocate the ubifs-slab shrinker
  rcu: dynamically allocate the rcu-lazy shrinker
  rcu: dynamically allocate the rcu-kfree shrinker
  mm: thp: dynamically allocate the thp-related shrinkers
  sunrpc: dynamically allocate the sunrpc_cred shrinker
  mm: workingset: dynamically allocate the mm-shadow shrinker
  drm/i915: dynamically allocate the i915_gem_mm shrinker
  drm/msm: dynamically allocate the drm-msm_gem shrinker
  drm/panfrost: dynamically allocate the drm-panfrost shrinker
  dm: dynamically allocate the dm-bufio shrinker
  dm zoned: dynamically allocate the dm-zoned-meta shrinker
  md/raid5: dynamically allocate the md-raid5 shrinker
  bcache: dynamically allocate the md-bcache shrinker
  vmw_balloon: dynamically allocate the vmw-balloon shrinker
  virtio_balloon: dynamically allocate the virtio-balloon shrinker
  mbcache: dynamically allocate the mbcache shrinker
  ext4: dynamically allocate the ext4-es shrinker
  jbd2,ext4: dynamically allocate the jbd2-journal shrinker
  nfsd: dynamically allocate the nfsd-client shrinker
  nfsd: dynamically allocate the nfsd-reply shrinker
  xfs: dynamically allocate the xfs-buf shrinker
  xfs: dynamically allocate the xfs-inodegc shrinker
  xfs: dynamically allocate the xfs-qm shrinker
  zsmalloc: dynamically allocate the mm-zspool shrinker
  fs: super: dynamically allocate the s_shrink
  mm: shrinker: remove old APIs
  drm/ttm: introduce pool_shrink_rwsem
  mm: shrinker: add a secondary array for shrinker_info::{map,
    nr_deferred}
  mm: shrinker: make global slab shrink lockless
  mm: shrinker: make memcg slab shrink lockless
  mm: shrinker: hold write lock to reparent shrinker nr_deferred
  mm: shrinker: convert shrinker_rwsem to mutex

 arch/x86/kvm/mmu/mmu.c                        |  18 +-
 drivers/android/binder_alloc.c                |  31 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  30 +-
 drivers/gpu/drm/i915/i915_drv.h               |   2 +-
 drivers/gpu/drm/msm/msm_drv.c                 |   4 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   4 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c        |  36 +-
 drivers/gpu/drm/panfrost/panfrost_device.h    |   2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |   6 +-
 drivers/gpu/drm/panfrost/panfrost_gem.h       |   2 +-
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |  32 +-
 drivers/gpu/drm/ttm/ttm_pool.c                |  38 +-
 drivers/md/bcache/bcache.h                    |   2 +-
 drivers/md/bcache/btree.c                     |  27 +-
 drivers/md/bcache/sysfs.c                     |   3 +-
 drivers/md/dm-bufio.c                         |  26 +-
 drivers/md/dm-cache-metadata.c                |   2 +-
 drivers/md/dm-zoned-metadata.c                |  28 +-
 drivers/md/raid5.c                            |  25 +-
 drivers/md/raid5.h                            |   2 +-
 drivers/misc/vmw_balloon.c                    |  38 +-
 drivers/virtio/virtio_balloon.c               |  25 +-
 drivers/xen/xenbus/xenbus_probe_backend.c     |  17 +-
 fs/btrfs/super.c                              |   2 +-
 fs/erofs/utils.c                              |  20 +-
 fs/ext4/ext4.h                                |   2 +-
 fs/ext4/extents_status.c                      |  22 +-
 fs/f2fs/super.c                               |  32 +-
 fs/gfs2/glock.c                               |  20 +-
 fs/gfs2/main.c                                |   6 +-
 fs/gfs2/quota.c                               |  26 +-
 fs/gfs2/quota.h                               |   3 +-
 fs/jbd2/journal.c                             |  27 +-
 fs/kernfs/mount.c                             |   2 +-
 fs/mbcache.c                                  |  23 +-
 fs/nfs/nfs42xattr.c                           |  87 +-
 fs/nfs/super.c                                |  20 +-
 fs/nfsd/filecache.c                           |  22 +-
 fs/nfsd/netns.h                               |   4 +-
 fs/nfsd/nfs4state.c                           |  20 +-
 fs/nfsd/nfscache.c                            |  31 +-
 fs/proc/root.c                                |   2 +-
 fs/quota/dquot.c                              |  17 +-
 fs/super.c                                    |  39 +-
 fs/ubifs/super.c                              |  22 +-
 fs/xfs/xfs_buf.c                              |  25 +-
 fs/xfs/xfs_buf.h                              |   2 +-
 fs/xfs/xfs_icache.c                           |  26 +-
 fs/xfs/xfs_mount.c                            |   4 +-
 fs/xfs/xfs_mount.h                            |   2 +-
 fs/xfs/xfs_qm.c                               |  26 +-
 fs/xfs/xfs_qm.h                               |   2 +-
 include/linux/fs.h                            |   2 +-
 include/linux/jbd2.h                          |   2 +-
 include/linux/memcontrol.h                    |  12 +-
 include/linux/shrinker.h                      |  54 +-
 kernel/rcu/tree.c                             |  21 +-
 kernel/rcu/tree_nocb.h                        |  19 +-
 mm/Makefile                                   |   4 +-
 mm/huge_memory.c                              |  69 +-
 mm/shrinker.c                                 | 772 ++++++++++++++++++
 mm/shrinker_debug.c                           |  76 +-
 mm/vmscan.c                                   | 701 ----------------
 mm/workingset.c                               |  26 +-
 mm/zsmalloc.c                                 |  28 +-
 net/sunrpc/auth.c                             |  19 +-
 66 files changed, 1516 insertions(+), 1225 deletions(-)
 create mode 100644 mm/shrinker.c

-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

