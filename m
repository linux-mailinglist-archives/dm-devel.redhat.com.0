Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A445765AE3
	for <lists+dm-devel@lfdr.de>; Thu, 27 Jul 2023 19:55:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690480536;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NQzjQtcIXYLRoL+fOkFwfhrcyWPIy+ODja204zp6Sd8=;
	b=hVmMZ9X/w48+QpYPD60thB0HBbMA/oAtZBPF9mgYd8Vu/I8sx3EYxPST6JFoerK5SrDRyL
	zgA5TNmrc+MSmzYEIZ4xmfsKniwNiEFMwuQuqqtFhshYlxnJTCpKyIgdg9oCWuLEaLcAwN
	t1tdnH+P+VqyETDUIdTXkAS9zfPYxg0=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-dO-k9iJrND2684nurHXl1Q-1; Thu, 27 Jul 2023 13:55:32 -0400
X-MC-Unique: dO-k9iJrND2684nurHXl1Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C62813C11A31;
	Thu, 27 Jul 2023 17:55:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A9B172166B27;
	Thu, 27 Jul 2023 17:55:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5B58E19451D2;
	Thu, 27 Jul 2023 17:55:05 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B2BDD1946A6C
 for <dm-devel@listman.corp.redhat.com>; Thu, 27 Jul 2023 08:15:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 912EE40C206F; Thu, 27 Jul 2023 08:15:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8455440C2063
 for <dm-devel@redhat.com>; Thu, 27 Jul 2023 08:15:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EF9B85CFB8
 for <dm-devel@redhat.com>; Thu, 27 Jul 2023 08:15:13 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-oXGkWeQTO8OC4hg3ljT6aQ-1; Thu, 27 Jul 2023 04:15:11 -0400
X-MC-Unique: oXGkWeQTO8OC4hg3ljT6aQ-1
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-682ae5d4184so171869b3a.1
 for <dm-devel@redhat.com>; Thu, 27 Jul 2023 01:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445710; x=1691050510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VvZzKGLWBPnU/YifQKDl8Wb9pt+zZKHS88YiwcrJMO0=;
 b=keu3ha9GT/Cw1mBk1U5NXSshindIqO3OJtCLiTmex54HM7XY0jnC+lkntsu4yRZohZ
 0MxCfWjiOvA7bLx2XuiHmDh6cQxxRo/ehKXcyz9POVDC13yG6ALU7OoA4CCIw4xaI2c5
 b2IqW6Jkp20wwA2hOeGzuLDKyd3rrAWM1bT3fL2AWN6evnLgSvyKxd7/evEd3E4W21nd
 fPSxRHRR2hV+DAvugCAZ49O6IEAQhl2OvwwhhTLL8LoKKxjTms0itdwX1SOdQq3xMyD6
 osQgIpYqwXUzU+ur9p+ikQzX9RCAIgv4MOYFVJkTEpmvLmnUKR1xl2kIfoBvSjAA2om1
 X9Tg==
X-Gm-Message-State: ABy/qLZP1kdCOQ7KebJhPOblLhdQzJH9djVnEAzGiRQBWM0WK7djg7bM
 XwNWsxFM11NtTKV8pbSbdFfjlQ==
X-Google-Smtp-Source: APBJJlFdwRyoe8DFBb0YfEbWLnk7UTz07biEby4+6kjTFVFVYib+WaYPD1SK6i9vhrIynDbldBSUcQ==
X-Received: by 2002:a62:1d04:0:b0:66f:3fc5:6167 with SMTP id
 d4-20020a621d04000000b0066f3fc56167mr4406413pfd.1.1690445710333; 
 Thu, 27 Jul 2023 01:15:10 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:15:09 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Thu, 27 Jul 2023 16:04:59 +0800
Message-Id: <20230727080502.77895-47-zhengqi.arch@bytedance.com>
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Thu, 27 Jul 2023 17:54:53 +0000
Subject: [dm-devel] [PATCH v3 46/49] mm: shrinker: make global slab shrink
 lockless
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The shrinker_rwsem is a global read-write lock in shrinkers subsystem,
which protects most operations such as slab shrink, registration and
unregistration of shrinkers, etc. This can easily cause problems in the
following cases.

1) When the memory pressure is high and there are many filesystems
   mounted or unmounted at the same time, slab shrink will be affected
   (down_read_trylock() failed).

   Such as the real workload mentioned by Kirill Tkhai:

   ```
   One of the real workloads from my experience is start
   of an overcommitted node containing many starting
   containers after node crash (or many resuming containers
   after reboot for kernel update). In these cases memory
   pressure is huge, and the node goes round in long reclaim.
   ```

2) If a shrinker is blocked (such as the case mentioned
   in [1]) and a writer comes in (such as mount a fs),
   then this writer will be blocked and cause all
   subsequent shrinker-related operations to be blocked.

Even if there is no competitor when shrinking slab, there may still be a
problem. The down_read_trylock() may become a perf hotspot with frequent
calls to shrink_slab(). Because of the poor multicore scalability of
atomic operations, this can lead to a significant drop in IPC
(instructions per cycle).

We used to implement the lockless slab shrink with SRCU [2], but then
kernel test robot reported -88.8% regression in
stress-ng.ramfs.ops_per_sec test case [3], so we reverted it [4].

This commit uses the refcount+RCU method [5] proposed by Dave Chinner
to re-implement the lockless global slab shrink. The memcg slab shrink is
handled in the subsequent patch.

For now, all shrinker instances are converted to dynamically allocated and
will be freed by call_rcu(). So we can use rcu_read_{lock,unlock}() to
ensure that the shrinker instance is valid.

And the shrinker instance will not be run again after unregistration. So
the structure that records the pointer of shrinker instance can be safely
freed without waiting for the RCU read-side critical section.

In this way, while we implement the lockless slab shrink, we don't need to
be blocked in unregister_shrinker().

The following are the test results:

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
ramfs            746698     60.00     12.45    376.16     12444.02        1921.47
for a 60.01s run time:
   1440.28s available CPU time
     12.44s user time   (  0.86%)
    376.16s system time ( 26.12%)
    388.60s total time  ( 26.98%)
load average: 9.01 3.85 1.49
passed: 9: ramfs (9)
failed: 0
skipped: 0
successful run completed in 60.01s (1 min, 0.01 secs)

We can see that the ops/s has hardly changed.

[1]. https://lore.kernel.org/lkml/20191129214541.3110-1-ptikhomirov@virtuozzo.com/
[2]. https://lore.kernel.org/lkml/20230313112819.38938-1-zhengqi.arch@bytedance.com/
[3]. https://lore.kernel.org/lkml/202305230837.db2c233f-yujie.liu@intel.com/
[4]. https://lore.kernel.org/all/20230609081518.3039120-1-qi.zheng@linux.dev/
[5]. https://lore.kernel.org/lkml/ZIJhou1d55d4H1s0@dread.disaster.area/

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/shrinker.h | 17 ++++++++++
 mm/shrinker.c            | 70 +++++++++++++++++++++++++++++-----------
 2 files changed, 68 insertions(+), 19 deletions(-)

diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
index eb342994675a..f06225f18531 100644
--- a/include/linux/shrinker.h
+++ b/include/linux/shrinker.h
@@ -4,6 +4,8 @@
 
 #include <linux/atomic.h>
 #include <linux/types.h>
+#include <linux/refcount.h>
+#include <linux/completion.h>
 
 #define SHRINKER_UNIT_BITS	BITS_PER_LONG
 
@@ -87,6 +89,10 @@ struct shrinker {
 	int seeks;	/* seeks to recreate an obj */
 	unsigned flags;
 
+	refcount_t refcount;
+	struct completion done;
+	struct rcu_head rcu;
+
 	void *private_data;
 
 	/* These are for internal use */
@@ -120,6 +126,17 @@ struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...);
 void shrinker_register(struct shrinker *shrinker);
 void shrinker_free(struct shrinker *shrinker);
 
+static inline bool shrinker_try_get(struct shrinker *shrinker)
+{
+	return refcount_inc_not_zero(&shrinker->refcount);
+}
+
+static inline void shrinker_put(struct shrinker *shrinker)
+{
+	if (refcount_dec_and_test(&shrinker->refcount))
+		complete(&shrinker->done);
+}
+
 #ifdef CONFIG_SHRINKER_DEBUG
 extern int __printf(2, 3) shrinker_debugfs_rename(struct shrinker *shrinker,
 						  const char *fmt, ...);
diff --git a/mm/shrinker.c b/mm/shrinker.c
index 1911c06b8af5..d318f5621862 100644
--- a/mm/shrinker.c
+++ b/mm/shrinker.c
@@ -2,6 +2,7 @@
 #include <linux/memcontrol.h>
 #include <linux/rwsem.h>
 #include <linux/shrinker.h>
+#include <linux/rculist.h>
 #include <trace/events/vmscan.h>
 
 #include "internal.h"
@@ -577,33 +578,42 @@ unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
 	if (!mem_cgroup_disabled() && !mem_cgroup_is_root(memcg))
 		return shrink_slab_memcg(gfp_mask, nid, memcg, priority);
 
-	if (!down_read_trylock(&shrinker_rwsem))
-		goto out;
-
-	list_for_each_entry(shrinker, &shrinker_list, list) {
+	rcu_read_lock();
+	list_for_each_entry_rcu(shrinker, &shrinker_list, list) {
 		struct shrink_control sc = {
 			.gfp_mask = gfp_mask,
 			.nid = nid,
 			.memcg = memcg,
 		};
 
+		if (!shrinker_try_get(shrinker))
+			continue;
+
+		/*
+		 * We can safely unlock the RCU lock here since we already
+		 * hold the refcount of the shrinker.
+		 */
+		rcu_read_unlock();
+
 		ret = do_shrink_slab(&sc, shrinker, priority);
 		if (ret == SHRINK_EMPTY)
 			ret = 0;
 		freed += ret;
+
 		/*
-		 * Bail out if someone want to register a new shrinker to
-		 * prevent the registration from being stalled for long periods
-		 * by parallel ongoing shrinking.
+		 * This shrinker may be deleted from shrinker_list and freed
+		 * after the shrinker_put() below, but this shrinker is still
+		 * used for the next traversal. So it is necessary to hold the
+		 * RCU lock first to prevent this shrinker from being freed,
+		 * which also ensures that the next shrinker that is traversed
+		 * will not be freed (even if it is deleted from shrinker_list
+		 * at the same time).
 		 */
-		if (rwsem_is_contended(&shrinker_rwsem)) {
-			freed = freed ? : 1;
-			break;
-		}
+		rcu_read_lock();
+		shrinker_put(shrinker);
 	}
 
-	up_read(&shrinker_rwsem);
-out:
+	rcu_read_unlock();
 	cond_resched();
 	return freed;
 }
@@ -671,13 +681,29 @@ void shrinker_register(struct shrinker *shrinker)
 	}
 
 	down_write(&shrinker_rwsem);
-	list_add_tail(&shrinker->list, &shrinker_list);
+	list_add_tail_rcu(&shrinker->list, &shrinker_list);
 	shrinker->flags |= SHRINKER_REGISTERED;
 	shrinker_debugfs_add(shrinker);
 	up_write(&shrinker_rwsem);
+
+	init_completion(&shrinker->done);
+	/*
+	 * Now the shrinker is fully set up, take the first reference to it to
+	 * indicate that lookup operations are now allowed to use it via
+	 * shrinker_try_get().
+	 */
+	refcount_set(&shrinker->refcount, 1);
 }
 EXPORT_SYMBOL_GPL(shrinker_register);
 
+static void shrinker_free_rcu_cb(struct rcu_head *head)
+{
+	struct shrinker *shrinker = container_of(head, struct shrinker, rcu);
+
+	kfree(shrinker->nr_deferred);
+	kfree(shrinker);
+}
+
 void shrinker_free(struct shrinker *shrinker)
 {
 	struct dentry *debugfs_entry = NULL;
@@ -686,9 +712,18 @@ void shrinker_free(struct shrinker *shrinker)
 	if (!shrinker)
 		return;
 
+	if (shrinker->flags & SHRINKER_REGISTERED) {
+		shrinker_put(shrinker);
+		wait_for_completion(&shrinker->done);
+	}
+
 	down_write(&shrinker_rwsem);
 	if (shrinker->flags & SHRINKER_REGISTERED) {
-		list_del(&shrinker->list);
+		/*
+		 * Lookups on the shrinker are over and will fail in the future,
+		 * so we can now remove it from the lists and free it.
+		 */
+		list_del_rcu(&shrinker->list);
 		debugfs_entry = shrinker_debugfs_detach(shrinker, &debugfs_id);
 		shrinker->flags &= ~SHRINKER_REGISTERED;
 	} else {
@@ -702,9 +737,6 @@ void shrinker_free(struct shrinker *shrinker)
 	if (debugfs_entry)
 		shrinker_debugfs_remove(debugfs_entry, debugfs_id);
 
-	kfree(shrinker->nr_deferred);
-	shrinker->nr_deferred = NULL;
-
-	kfree(shrinker);
+	call_rcu(&shrinker->rcu, shrinker_free_rcu_cb);
 }
 EXPORT_SYMBOL_GPL(shrinker_free);
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

