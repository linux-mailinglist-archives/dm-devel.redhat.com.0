Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B071F73AFDD
	for <lists+dm-devel@lfdr.de>; Fri, 23 Jun 2023 07:26:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687498010;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RInEcH3me3Bxzqw1P9B4DqMvhQ13FaLo7PJq4QPvP3k=;
	b=IO6k0++MPLKLEAswLMi5iu4nYqODXJkwISlcHPRB0o/pSo87+uYtYCyawoN8aKdrS/ukjM
	y8rxJ1mXR3UjRqlAs9fs1HpfPCTjVF8f5kgRpTH2KIrFcoqJCV2GCglHoe0nNA/nlQ88OG
	/iCkect99w7dFuGTwGYQY4VYtKBRzsQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-tTSn3IXJMsCXqa9y3oAGkg-1; Fri, 23 Jun 2023 01:26:45 -0400
X-MC-Unique: tTSn3IXJMsCXqa9y3oAGkg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B25E33C1C4CF;
	Fri, 23 Jun 2023 05:26:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A40A40C2063;
	Fri, 23 Jun 2023 05:25:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B636B1946A72;
	Fri, 23 Jun 2023 05:25:41 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 760D8194658C
 for <dm-devel@listman.corp.redhat.com>; Thu, 22 Jun 2023 08:54:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5DFEB200BA8B; Thu, 22 Jun 2023 08:54:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5604B2017DE2
 for <dm-devel@redhat.com>; Thu, 22 Jun 2023 08:54:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 075071C07256
 for <dm-devel@redhat.com>; Thu, 22 Jun 2023 08:54:06 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-ntOAutC_Oauj9x8XqI77BQ-1; Thu, 22 Jun 2023 04:54:03 -0400
X-MC-Unique: ntOAutC_Oauj9x8XqI77BQ-1
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-54f73ef19e5so678602a12.0
 for <dm-devel@redhat.com>; Thu, 22 Jun 2023 01:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687424042; x=1690016042;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=18F0YS9tzXnhZD6XOWg4z/iuVQH+DQZqb8vPxg9LKNc=;
 b=W6Y9QdNOqNfO1fKuHIbImpcii3QWz8vt/mJHpNq2EaZNeIK9KK4MOK1aqjrPkXcHUe
 lVuuixRuGPUDe0HXwfhv2ECwdUiFjuTlAJAwGV/oBHzvyjf3Zi4Dci0bqess6zTe9M95
 gUvVXeqj0yPQn+lWsp+B3LHeVTTGi10AjU59VE0TXWFB0G0A8TwGa30oyKff+7I2noxB
 FF2Hz/mf6mTS6ae6pBRTne2Qa0RoRSd+c5T1NX4QWQEds2mr5Tmxqpu5zRuXkhOZadLR
 ArD9e14mTm6yZ3egWWme7UFJFHO9KsgZX2o81+aMhCenuRoTFVvYaf4ZuOX5ANpByKby
 TGBQ==
X-Gm-Message-State: AC+VfDz4fws6xLM+D9sPPOJ7D3k8+CHDuN2SkTyUBXLB85/tH5wqxQZJ
 CVpZhrFEZrCef7aWmGd5FkXqGw==
X-Google-Smtp-Source: ACHHUZ7tnYlzDA7Fu4iKKHZ/SyjbSwiKqkCQ8vesEKB/Fu9/UuDv/k/NRhRg959nnXG3X3ZwdczzWg==
X-Received: by 2002:a17:902:ea01:b0:1a9:6467:aa8d with SMTP id
 s1-20020a170902ea0100b001a96467aa8dmr21668996plg.1.1687424042552; 
 Thu, 22 Jun 2023 01:54:02 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.254])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a170902f7c200b001b549fce345sm4806971plw.230.2023.06.22.01.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 01:54:02 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu
Date: Thu, 22 Jun 2023 16:53:06 +0800
Message-Id: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Fri, 23 Jun 2023 05:25:40 +0000
Subject: [dm-devel] [PATCH 00/29] use refcount+RCU method to implement
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
Cc: linux-bcache@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-raid@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 Qi Zheng <zhengqi.arch@bytedance.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

For *case a*, the memory of shrinker instance is never freed. For *case b*, the
memory of shrinker instance will be freed after the module is unloaded. But we
will call synchronize_rcu() in free_module() to wait for RCU read-side critical
section to exit. For *case c*, we need to dynamically allocate these shrinker
instances, then the memory of shrinker instance can be dynamically freed alone
by calling kfree_rcu(). Then we can use rcu_read_{lock,unlock}() to ensure that
the shrinker instance is valid.

The shrinker::refcount mechanism ensures that the shrinker instance will not be
run again after unregistration. So the structure that records the pointer of
shrinker instance can be safely freed without waiting for the RCU read-side
critical section.

In this way, while we implement the lockless slab shrink, we don't need to be
blocked in unregister_shrinker() to wait RCU read-side critical section.

PATCH 1 ~ 2: infrastructure for dynamically allocating shrinker instances
PATCH 3 ~ 21: dynamically allocate the shrinker instances in case c
PATCH 22: introduce pool_shrink_rwsem to implement private synchronize_shrinkers()
PATCH 23 ~ 28: implement the lockless slab shrink
PATCH 29: move shrinker-related code into a separate file

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
    mkdir -p /sys/fs/cgroup/perf_event/test
    echo 4G > /sys/fs/cgroup/memory/test/memory.limit_in_bytes
    for i in `seq 0 $1`;
    do
        mkdir -p /sys/fs/cgroup/memory/test/$i;
        echo $$ > /sys/fs/cgroup/memory/test/$i/cgroup.procs;
        echo $$ > /sys/fs/cgroup/perf_event/test/cgroup.procs;
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
        echo $$ > /sys/fs/cgroup/perf_event/test/cgroup.procs;
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

perf top -U -F 999 [-g]

1) Before applying this patchset:

  35.34%  [kernel]             [k] down_read_trylock
  18.44%  [kernel]             [k] shrink_slab
  15.98%  [kernel]             [k] pv_native_safe_halt
  15.08%  [kernel]             [k] up_read
   5.33%  [kernel]             [k] idr_find
   2.71%  [kernel]             [k] _find_next_bit
   2.21%  [kernel]             [k] shrink_node
   1.29%  [kernel]             [k] shrink_lruvec
   0.66%  [kernel]             [k] do_shrink_slab
   0.33%  [kernel]             [k] list_lru_count_one
   0.33%  [kernel]             [k] __radix_tree_lookup
   0.25%  [kernel]             [k] mem_cgroup_iter

-   82.19%    19.49%  [kernel]                  [k] shrink_slab
   - 62.00% shrink_slab
        36.37% down_read_trylock
        15.52% up_read
        5.48% idr_find
        3.38% _find_next_bit
      + 0.98% do_shrink_slab

2) After applying this patchset:

  46.83%  [kernel]           [k] shrink_slab
  20.52%  [kernel]           [k] pv_native_safe_halt
   8.85%  [kernel]           [k] do_shrink_slab
   7.71%  [kernel]           [k] _find_next_bit
   1.72%  [kernel]           [k] xas_descend
   1.70%  [kernel]           [k] shrink_node
   1.44%  [kernel]           [k] shrink_lruvec
   1.43%  [kernel]           [k] mem_cgroup_iter
   1.28%  [kernel]           [k] xas_load
   0.89%  [kernel]           [k] super_cache_count
   0.84%  [kernel]           [k] xas_start
   0.66%  [kernel]           [k] list_lru_count_one

-   65.50%    40.44%  [kernel]                  [k] shrink_slab
   - 22.96% shrink_slab
        13.11% _find_next_bit
      - 9.91% do_shrink_slab
         - 1.59% super_cache_count
              0.92% list_lru_count_one

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
 ramfs            880623     60.02      7.71    226.93     14671.45        3753.09
 ramfs:
          1 System Management Interrupt
 for a 60.03s run time:
    5762.40s available CPU time
       7.71s user time   (  0.13%)
     226.93s system time (  3.94%)
     234.64s total time  (  4.07%)
 load average: 8.54 3.06 2.11
 passed: 9: ramfs (9)
 failed: 0
 skipped: 0
 successful run completed in 60.03s (1 min, 0.03 secs)

2) After applying this patchset:

 setting to a 60 second run per stressor
 dispatching hogs: 9 ramfs
 stressor       bogo ops real time  usr time  sys time   bogo ops/s     bogo ops/s
                           (secs)    (secs)    (secs)   (real time) (usr+sys time)
 ramfs            847562     60.02      7.44    230.22     14120.66        3566.23
 ramfs:
          4 System Management Interrupts
 for a 60.12s run time:
    5771.95s available CPU time
       7.44s user time   (  0.13%)
     230.22s system time (  3.99%)
     237.66s total time  (  4.12%)
 load average: 8.18 2.43 0.84
 passed: 9: ramfs (9)
 failed: 0
 skipped: 0
 successful run completed in 60.12s (1 min, 0.12 secs)

We can see that the ops/s has hardly changed.

This series is based on next-20230613.

Comments and suggestions are welcome.

Thanks,
Qi.

Qi Zheng (29):
  mm: shrinker: add shrinker::private_data field
  mm: vmscan: introduce some helpers for dynamically allocating shrinker
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
  NFSD: dynamically allocate the nfsd-client shrinker
  NFSD: dynamically allocate the nfsd-reply shrinker
  xfs: dynamically allocate the xfs-buf shrinker
  xfs: dynamically allocate the xfs-inodegc shrinker
  xfs: dynamically allocate the xfs-qm shrinker
  zsmalloc: dynamically allocate the mm-zspool shrinker
  fs: super: dynamically allocate the s_shrink
  drm/ttm: introduce pool_shrink_rwsem
  mm: shrinker: add refcount and completion_wait fields
  mm: vmscan: make global slab shrink lockless
  mm: vmscan: make memcg slab shrink lockless
  mm: shrinker: make count and scan in shrinker debugfs lockless
  mm: vmscan: hold write lock to reparent shrinker nr_deferred
  mm: shrinkers: convert shrinker_rwsem to mutex
  mm: shrinker: move shrinker-related code into a separate file

 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  27 +-
 drivers/gpu/drm/i915/i915_drv.h               |   3 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   2 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c        |  25 +-
 drivers/gpu/drm/panfrost/panfrost_device.h    |   2 +-
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |  24 +-
 drivers/gpu/drm/ttm/ttm_pool.c                |  15 +
 drivers/md/bcache/bcache.h                    |   2 +-
 drivers/md/bcache/btree.c                     |  23 +-
 drivers/md/bcache/sysfs.c                     |   2 +-
 drivers/md/dm-bufio.c                         |  23 +-
 drivers/md/dm-cache-metadata.c                |   2 +-
 drivers/md/dm-thin-metadata.c                 |   2 +-
 drivers/md/dm-zoned-metadata.c                |  25 +-
 drivers/md/raid5.c                            |  28 +-
 drivers/md/raid5.h                            |   2 +-
 drivers/misc/vmw_balloon.c                    |  16 +-
 drivers/virtio/virtio_balloon.c               |  26 +-
 fs/btrfs/super.c                              |   2 +-
 fs/ext4/ext4.h                                |   2 +-
 fs/ext4/extents_status.c                      |  21 +-
 fs/jbd2/journal.c                             |  32 +-
 fs/kernfs/mount.c                             |   2 +-
 fs/mbcache.c                                  |  39 +-
 fs/nfsd/netns.h                               |   4 +-
 fs/nfsd/nfs4state.c                           |  20 +-
 fs/nfsd/nfscache.c                            |  33 +-
 fs/proc/root.c                                |   2 +-
 fs/super.c                                    |  40 +-
 fs/xfs/xfs_buf.c                              |  25 +-
 fs/xfs/xfs_buf.h                              |   2 +-
 fs/xfs/xfs_icache.c                           |  27 +-
 fs/xfs/xfs_mount.c                            |   4 +-
 fs/xfs/xfs_mount.h                            |   2 +-
 fs/xfs/xfs_qm.c                               |  24 +-
 fs/xfs/xfs_qm.h                               |   2 +-
 include/linux/fs.h                            |   2 +-
 include/linux/jbd2.h                          |   2 +-
 include/linux/shrinker.h                      |  35 +-
 mm/Makefile                                   |   4 +-
 mm/shrinker.c                                 | 750 ++++++++++++++++++
 mm/shrinker_debug.c                           |  26 +-
 mm/vmscan.c                                   | 702 ----------------
 mm/zsmalloc.c                                 |  28 +-
 44 files changed, 1128 insertions(+), 953 deletions(-)
 create mode 100644 mm/shrinker.c

-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

