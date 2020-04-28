Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 79F4B1BBAD8
	for <lists+dm-devel@lfdr.de>; Tue, 28 Apr 2020 12:09:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588068595;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s5XwnNi5VV6kvu0Bz4cJ9O8y51ud9Q+m8vgFbxAMbYQ=;
	b=D1v2D6iGMtaggPtC3tK5y38frQK4R11ns5c5aO1/Q5KwDB1Gj2jmsoBoez4twKI+vOq7ox
	Fz4WmD/V7awDenkEHOLN078mQ0kaOLA5ccE8jDAREZkNOX1zXDuZWEKuzfDiy/6FC+vjFD
	JcBCXrP7pjbisErDMfn14rD78z5FepQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-m6oNOQzJMSOI9eK0xGcw0Q-1; Tue, 28 Apr 2020 06:09:52 -0400
X-MC-Unique: m6oNOQzJMSOI9eK0xGcw0Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B07F835B43;
	Tue, 28 Apr 2020 10:09:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CF0D5D9E2;
	Tue, 28 Apr 2020 10:09:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB6F14CA94;
	Tue, 28 Apr 2020 10:09:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03S0q81J011315 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 27 Apr 2020 20:52:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 63ACE2166B28; Tue, 28 Apr 2020 00:52:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F7EA2166B27
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 00:52:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E1BC8008A3
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 00:52:06 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
	[46.235.227.227]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-105-8qCzGsjiOyiL4yxVahprlg-1; Mon, 27 Apr 2020 20:52:03 -0400
X-MC-Unique: 8qCzGsjiOyiL4yxVahprlg-1
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: krisman) with ESMTPSA id 15A5C2A0D12
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: agk@redhat.com, snitzer@redhat.com
Date: Mon, 27 Apr 2020 20:51:46 -0400
Message-Id: <20200428005146.242231-4-krisman@collabora.com>
In-Reply-To: <20200428005146.242231-1-krisman@collabora.com>
References: <20200428005146.242231-1-krisman@collabora.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03S0q81J011315
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 28 Apr 2020 06:09:31 -0400
Cc: dm-devel@redhat.com, kernel@collabora.com,
	Gabriel Krisman Bertazi <krisman@collabora.com>, khazhy@google.com
Subject: [dm-devel] [PATCH v2 3/3] md: Add Historical Service Time Path
	Selector
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Khazhismel Kumykov <khazhy@google.com>

This new selector keeps an exponential moving average of the service
time for each path (losely defined as delta between start_io and
end_io), and uses this along with the number of inflight requests to
estimate future service time for a path.  Since we don't have a prober
to account for temporally slow paths, re-try "slow" paths every once in
a while (num_paths * historical_service_time). To account for fast paths
transitioning to slow, if a path has not completed any request within
(num_paths * historical_service_time), limit the number of outstanding
requests.  To account for low volume situations where number of
inflights would be zero, the last finish time of each path is factored
in.

Signed-off-by: Khazhismel Kumykov <khazhy@google.com>
Co-developed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 drivers/md/Kconfig                      |  11 +
 drivers/md/Makefile                     |   1 +
 drivers/md/dm-historical-service-time.c | 561 ++++++++++++++++++++++++
 3 files changed, 573 insertions(+)
 create mode 100644 drivers/md/dm-historical-service-time.c

diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
index 37f05707c59d..5669eeb5cf6f 100644
--- a/drivers/md/Kconfig
+++ b/drivers/md/Kconfig
@@ -452,6 +452,17 @@ config DM_MULTIPATH_ST
 
 	  If unsure, say N.
 
+config DM_MULTIPATH_HST
+	tristate "I/O Path Selector based on historical service time"
+	depends on DM_MULTIPATH
+	help
+	  This path selector is a dynamic load balancer which selects
+	  the path expected to complete the incoming I/O in the shortest
+	  time by comparing estimated service time (based on historical
+	  service time).
+
+	  If unsure, say N.
+
 config DM_DELAY
 	tristate "I/O delaying target"
 	depends on BLK_DEV_DM
diff --git a/drivers/md/Makefile b/drivers/md/Makefile
index 9a2d673f94bc..31840f95cd40 100644
--- a/drivers/md/Makefile
+++ b/drivers/md/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_DM_FLAKEY)		+= dm-flakey.o
 obj-$(CONFIG_DM_MULTIPATH)	+= dm-multipath.o dm-round-robin.o
 obj-$(CONFIG_DM_MULTIPATH_QL)	+= dm-queue-length.o
 obj-$(CONFIG_DM_MULTIPATH_ST)	+= dm-service-time.o
+obj-$(CONFIG_DM_MULTIPATH_HST)	+= dm-historical-service-time.o
 obj-$(CONFIG_DM_SWITCH)		+= dm-switch.o
 obj-$(CONFIG_DM_SNAPSHOT)	+= dm-snapshot.o
 obj-$(CONFIG_DM_PERSISTENT_DATA)	+= persistent-data/
diff --git a/drivers/md/dm-historical-service-time.c b/drivers/md/dm-historical-service-time.c
new file mode 100644
index 000000000000..866195048ef9
--- /dev/null
+++ b/drivers/md/dm-historical-service-time.c
@@ -0,0 +1,561 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Historical Service Time
+ *
+ *  Keeps a time-weighted exponential moving average of the historical
+ *  service time. Estimates future service time based on the historical
+ *  service time and the number of outstanding requests.
+ *
+ *  Marks paths stale if they have not finished within hst *
+ *  num_paths. If a path is stale and unused, we will send a single
+ *  request to probe in case the path has improved. This situation
+ *  generally arises if the path is so much worse than others that it
+ *  will never have the best estimated service time, or if the entire
+ *  multipath device is unused. If a path is stale and in use, limit the
+ *  number of requests it can receive with the assumption that the path
+ *  has become degraded.
+ *
+ *  To avoid repeatedly calculating exponents for time weighting, times
+ *  are split into HST_WEIGHT_COUNT buckets each (1 >> HST_BUCKET_SHIFT)
+ *  ns, and the weighting is pre-calculated.
+ *
+ */
+
+#include "dm.h"
+#include "dm-path-selector.h"
+
+#include <linux/blkdev.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+
+
+#define DM_MSG_PREFIX	"multipath historical-service-time"
+#define HST_MIN_IO 1
+#define HST_VERSION "0.1.1"
+
+#define HST_FIXED_SHIFT 10  /* 10 bits of decimal precision */
+#define HST_FIXED_MAX (ULLONG_MAX >> HST_FIXED_SHIFT)
+#define HST_FIXED_1 (1 << HST_FIXED_SHIFT)
+#define HST_FIXED_95 972
+#define HST_MAX_INFLIGHT HST_FIXED_1
+#define HST_BUCKET_SHIFT 24 /* Buckets are ~ 16ms */
+#define HST_WEIGHT_COUNT 64ULL
+
+struct selector {
+	struct list_head valid_paths;
+	struct list_head failed_paths;
+	int valid_count;
+	spinlock_t lock;
+
+	unsigned int weights[HST_WEIGHT_COUNT];
+	unsigned int threshold_multiplier;
+};
+
+struct path_info {
+	struct list_head list;
+	struct dm_path *path;
+	unsigned int repeat_count;
+
+	spinlock_t lock;
+
+	u64 historical_service_time; /* Fixed point */
+
+	u64 stale_after;
+	u64 last_finish;
+
+	u64 outstanding;
+};
+
+/**
+ * fixed_power - compute: x^n, in O(log n) time
+ *
+ * @x:         base of the power
+ * @frac_bits: fractional bits of @x
+ * @n:         power to raise @x to.
+ *
+ * By exploiting the relation between the definition of the natural power
+ * function: x^n := x*x*...*x (x multiplied by itself for n times), and
+ * the binary encoding of numbers used by computers: n := \Sum n_i * 2^i,
+ * (where: n_i \elem {0, 1}, the binary vector representing n),
+ * we find: x^n := x^(\Sum n_i * 2^i) := \Prod x^(n_i * 2^i), which is
+ * of course trivially computable in O(log_2 n), the length of our binary
+ * vector.
+ *
+ * (see: kernel/sched/loadavg.c)
+ */
+static u64 fixed_power(u64 x, unsigned int frac_bits, unsigned int n)
+{
+	unsigned long result = 1UL << frac_bits;
+
+	if (n) {
+		for (;;) {
+			if (n & 1) {
+				result *= x;
+				result += 1UL << (frac_bits - 1);
+				result >>= frac_bits;
+			}
+			n >>= 1;
+			if (!n)
+				break;
+			x *= x;
+			x += 1UL << (frac_bits - 1);
+			x >>= frac_bits;
+		}
+	}
+
+	return result;
+}
+
+/*
+ * Calculate the next value of an exponential moving average
+ * a_1 = a_0 * e + a * (1 - e)
+ *
+ * @last: [0, ULLONG_MAX >> HST_FIXED_SHIFT]
+ * @next: [0, ULLONG_MAX >> HST_FIXED_SHIFT]
+ * @weight: [0, HST_FIXED_1]
+ *
+ * Note:
+ *   To account for multiple periods in the same calculation,
+ *   a_n = a_0 * e^n + a * (1 - e^n),
+ *   so call fixed_ema(last, next, pow(weight, N))
+ */
+static u64 fixed_ema(u64 last, u64 next, u64 weight)
+{
+	last *= weight;
+	last += next * (HST_FIXED_1 - weight);
+	last += 1ULL << (HST_FIXED_SHIFT - 1);
+	return last >> HST_FIXED_SHIFT;
+}
+
+static struct selector *alloc_selector(void)
+{
+	struct selector *s = kmalloc(sizeof(*s), GFP_KERNEL);
+
+	if (s) {
+		INIT_LIST_HEAD(&s->valid_paths);
+		INIT_LIST_HEAD(&s->failed_paths);
+		spin_lock_init(&s->lock);
+		s->valid_count = 0;
+	}
+
+	return s;
+}
+
+/*
+ * Get the weight for a given time span.
+ */
+static u64 hst_weight(struct path_selector *ps, u64 delta)
+{
+	struct selector *s = ps->context;
+	int bucket = clamp(delta >> HST_BUCKET_SHIFT, 0ULL,
+			   HST_WEIGHT_COUNT - 1);
+
+	return s->weights[bucket];
+}
+
+/*
+ * Set up the weights array.
+ *
+ * weights[len-1] = 0
+ * weights[n] = base ^ (n + 1)
+ */
+static void hst_set_weights(struct path_selector *ps, unsigned int base)
+{
+	struct selector *s = ps->context;
+	int i;
+
+	if (base >= HST_FIXED_1)
+		return;
+
+	for (i = 0; i < HST_WEIGHT_COUNT - 1; i++)
+		s->weights[i] = fixed_power(base, HST_FIXED_SHIFT, i + 1);
+	s->weights[HST_WEIGHT_COUNT - 1] = 0;
+}
+
+static int hst_create(struct path_selector *ps, unsigned int argc, char **argv)
+{
+	struct selector *s;
+	unsigned int base_weight = HST_FIXED_95;
+	unsigned int threshold_multiplier = 0;
+	char dummy;
+
+	/*
+	 * Arguments: [<base_weight> [<threshold_multiplier>]]
+	 *   <base_weight>: Base weight for ema [0, 1024) 10-bit fixed point. A
+	 *                  value of 0 will completely ignore any history.
+	 *                  If not given, default (HST_FIXED_95) is used.
+	 *   <threshold_multiplier>: Minimum threshold multiplier for paths to
+	 *                  be considered different. That is, a path is
+	 *                  considered different iff (p1 > N * p2) where p1
+	 *                  is the path with higher service time. A threshold
+	 *                  of 1 or 0 has no effect. Defaults to 0.
+	 */
+	if (argc > 2)
+		return -EINVAL;
+
+	if (argc && (sscanf(argv[0], "%u%c", &base_weight, &dummy) != 1 ||
+	     base_weight >= HST_FIXED_1)) {
+		return -EINVAL;
+	}
+
+	if (argc > 1 && (sscanf(argv[1], "%u%c",
+				&threshold_multiplier, &dummy) != 1)) {
+		return -EINVAL;
+	}
+
+	s = alloc_selector();
+	if (!s)
+		return -ENOMEM;
+
+	ps->context = s;
+
+	hst_set_weights(ps, base_weight);
+	s->threshold_multiplier = threshold_multiplier;
+	return 0;
+}
+
+static void free_paths(struct list_head *paths)
+{
+	struct path_info *pi, *next;
+
+	list_for_each_entry_safe(pi, next, paths, list) {
+		list_del(&pi->list);
+		kfree(pi);
+	}
+}
+
+static void hst_destroy(struct path_selector *ps)
+{
+	struct selector *s = ps->context;
+
+	free_paths(&s->valid_paths);
+	free_paths(&s->failed_paths);
+	kfree(s);
+	ps->context = NULL;
+}
+
+static int hst_status(struct path_selector *ps, struct dm_path *path,
+		     status_type_t type, char *result, unsigned int maxlen)
+{
+	unsigned int sz = 0;
+	struct path_info *pi;
+
+	if (!path) {
+		struct selector *s = ps->context;
+
+		DMEMIT("2 %u %u ", s->weights[0], s->threshold_multiplier);
+	} else {
+		pi = path->pscontext;
+
+		switch (type) {
+		case STATUSTYPE_INFO:
+			DMEMIT("%llu %llu %llu ", pi->historical_service_time,
+			       pi->outstanding, pi->stale_after);
+			break;
+		case STATUSTYPE_TABLE:
+			DMEMIT("0 ");
+			break;
+		}
+	}
+
+	return sz;
+}
+
+static int hst_add_path(struct path_selector *ps, struct dm_path *path,
+		       int argc, char **argv, char **error)
+{
+	struct selector *s = ps->context;
+	struct path_info *pi;
+	unsigned int repeat_count = HST_MIN_IO;
+	char dummy;
+	unsigned long flags;
+
+	/*
+	 * Arguments: [<repeat_count>]
+	 *   <repeat_count>: The number of I/Os before switching path.
+	 *                   If not given, default (HST_MIN_IO) is used.
+	 */
+	if (argc > 1) {
+		*error = "historical-service-time ps: incorrect number of arguments";
+		return -EINVAL;
+	}
+
+	if (argc && (sscanf(argv[0], "%u%c", &repeat_count, &dummy) != 1)) {
+		*error = "historical-service-time ps: invalid repeat count";
+		return -EINVAL;
+	}
+
+	/* allocate the path */
+	pi = kmalloc(sizeof(*pi), GFP_KERNEL);
+	if (!pi) {
+		*error = "historical-service-time ps: Error allocating path context";
+		return -ENOMEM;
+	}
+
+	pi->path = path;
+	pi->repeat_count = repeat_count;
+
+	pi->historical_service_time = HST_FIXED_1;
+
+	spin_lock_init(&pi->lock);
+	pi->outstanding = 0;
+
+	pi->stale_after = 0;
+	pi->last_finish = 0;
+
+	path->pscontext = pi;
+
+	spin_lock_irqsave(&s->lock, flags);
+	list_add_tail(&pi->list, &s->valid_paths);
+	s->valid_count++;
+	spin_unlock_irqrestore(&s->lock, flags);
+
+	return 0;
+}
+
+static void hst_fail_path(struct path_selector *ps, struct dm_path *path)
+{
+	struct selector *s = ps->context;
+	struct path_info *pi = path->pscontext;
+	unsigned long flags;
+
+	spin_lock_irqsave(&s->lock, flags);
+	list_move(&pi->list, &s->failed_paths);
+	s->valid_count--;
+	spin_unlock_irqrestore(&s->lock, flags);
+}
+
+static int hst_reinstate_path(struct path_selector *ps, struct dm_path *path)
+{
+	struct selector *s = ps->context;
+	struct path_info *pi = path->pscontext;
+	unsigned long flags;
+
+	spin_lock_irqsave(&s->lock, flags);
+	list_move_tail(&pi->list, &s->valid_paths);
+	s->valid_count++;
+	spin_unlock_irqrestore(&s->lock, flags);
+
+	return 0;
+}
+
+static void hst_fill_compare(struct path_info *pi, u64 *hst,
+			     u64 *out, u64 *stale)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&pi->lock, flags);
+	*hst = pi->historical_service_time;
+	*out = pi->outstanding;
+	*stale = pi->stale_after;
+	spin_unlock_irqrestore(&pi->lock, flags);
+}
+
+/*
+ * Compare the estimated service time of 2 paths, pi1 and pi2,
+ * for the incoming I/O.
+ *
+ * Returns:
+ * < 0 : pi1 is better
+ * 0   : no difference between pi1 and pi2
+ * > 0 : pi2 is better
+ *
+ */
+static long long hst_compare(struct path_info *pi1, struct path_info *pi2,
+			     u64 time_now, struct path_selector *ps)
+{
+	struct selector *s = ps->context;
+	u64 hst1, hst2;
+	long long out1, out2, stale1, stale2;
+	int pi2_better, over_threshold;
+
+	hst_fill_compare(pi1, &hst1, &out1, &stale1);
+	hst_fill_compare(pi2, &hst2, &out2, &stale2);
+
+	/* Check here if estimated latency for two paths are too similar.
+	 * If this is the case, we skip extra calculation and just compare
+	 * outstanding requests. In this case, any unloaded paths will
+	 * be preferred.
+	 */
+	if (hst1 > hst2)
+		over_threshold = hst1 > (s->threshold_multiplier * hst2);
+	else
+		over_threshold = hst2 > (s->threshold_multiplier * hst1);
+
+	if (!over_threshold)
+		return out1 - out2;
+
+	/*
+	 * If an unloaded path is stale, choose it. If both paths are unloaded,
+	 * choose path that is the most stale.
+	 * (If one path is loaded, choose the other)
+	 */
+	if ((!out1 && stale1 < time_now) || (!out2 && stale2 < time_now) ||
+	    (!out1 && !out2))
+		return (!out2 * stale1) - (!out1 * stale2);
+
+	/* Compare estimated service time. If outstanding is the same, we
+	 * don't need to multiply
+	 */
+	if (out1 == out2) {
+		pi2_better = hst1 > hst2;
+	} else {
+		/* Potential overflow with out >= 1024 */
+		if (unlikely(out1 >= HST_MAX_INFLIGHT ||
+			     out2 >= HST_MAX_INFLIGHT)) {
+			/* If over 1023 in-flights, we may overflow if hst
+			 * is at max. (With this shift we still overflow at
+			 * 1048576 in-flights, which is high enough).
+			 */
+			hst1 >>= HST_FIXED_SHIFT;
+			hst2 >>= HST_FIXED_SHIFT;
+		}
+		pi2_better = (1 + out1) * hst1 > (1 + out2) * hst2;
+	}
+
+	/* In the case that the 'winner' is stale, limit to equal usage. */
+	if (pi2_better) {
+		if (stale2 < time_now)
+			return out1 - out2;
+		return 1;
+	}
+	if (stale1 < time_now)
+		return out1 - out2;
+	return -1;
+}
+
+static struct dm_path *hst_select_path(struct path_selector *ps,
+				       size_t nr_bytes)
+{
+	struct selector *s = ps->context;
+	struct path_info *pi = NULL, *best = NULL;
+	u64 time_now = sched_clock();
+	struct dm_path *ret = NULL;
+	unsigned long flags;
+
+	spin_lock_irqsave(&s->lock, flags);
+	if (list_empty(&s->valid_paths))
+		goto out;
+
+	list_for_each_entry(pi, &s->valid_paths, list) {
+		if (!best || (hst_compare(pi, best, time_now, ps) < 0))
+			best = pi;
+	}
+
+	if (!best)
+		goto out;
+
+	/* Move last used path to end (least preferred in case of ties) */
+	list_move_tail(&best->list, &s->valid_paths);
+
+	ret = best->path;
+
+out:
+	spin_unlock_irqrestore(&s->lock, flags);
+	return ret;
+}
+
+static int hst_start_io(struct path_selector *ps, struct dm_path *path,
+			const struct path_selector_io_data *io_data)
+{
+	struct path_info *pi = path->pscontext;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pi->lock, flags);
+	pi->outstanding++;
+	spin_unlock_irqrestore(&pi->lock, flags);
+
+	return 0;
+}
+
+static u64 path_service_time(struct path_info *pi, u64 start_time)
+{
+	u64 sched_now = ktime_get_ns();
+
+	/* if a previous disk request has finished after this IO was
+	 * sent to the hardware, pretend the submission happened
+	 * serially.
+	 */
+	if (time_after64(pi->last_finish, start_time))
+		start_time = pi->last_finish;
+
+	pi->last_finish = sched_now;
+	if (time_before64(sched_now, start_time))
+		return 0;
+
+	return sched_now - start_time;
+}
+
+static int hst_end_io(struct path_selector *ps, struct dm_path *path,
+		      const struct path_selector_io_data *io_data)
+{
+	struct path_info *pi = path->pscontext;
+	struct selector *s = ps->context;
+	unsigned long flags;
+	u64 st;
+
+	spin_lock_irqsave(&pi->lock, flags);
+
+	st = path_service_time(pi, io_data->io_start_time);
+	pi->outstanding--;
+	pi->historical_service_time =
+		fixed_ema(pi->historical_service_time,
+			  min(st * HST_FIXED_1, HST_FIXED_MAX),
+			  hst_weight(ps, st));
+
+	/*
+	 * On request end, mark path as fresh. If a path hasn't
+	 * finished any requests within the fresh period, the estimated
+	 * service time is considered too optimistic and we limit the
+	 * maximum requests on that path.
+	 */
+	pi->stale_after = pi->last_finish +
+		(s->valid_count * (pi->historical_service_time >> HST_FIXED_SHIFT));
+
+	spin_unlock_irqrestore(&pi->lock, flags);
+
+	return 0;
+}
+
+static struct path_selector_type hst_ps = {
+	.name		= "historical-service-time",
+	.module		= THIS_MODULE,
+	.table_args	= 1,
+	.info_args	= 3,
+	.create		= hst_create,
+	.destroy	= hst_destroy,
+	.status		= hst_status,
+	.add_path	= hst_add_path,
+	.fail_path	= hst_fail_path,
+	.reinstate_path	= hst_reinstate_path,
+	.select_path	= hst_select_path,
+	.start_io	= hst_start_io,
+	.end_io		= hst_end_io,
+};
+
+static int __init dm_hst_init(void)
+{
+	int r = dm_register_path_selector(&hst_ps);
+
+	if (r < 0)
+		DMERR("register failed %d", r);
+
+	DMINFO("version " HST_VERSION " loaded");
+
+	return r;
+}
+
+static void __exit dm_hst_exit(void)
+{
+	int r = dm_unregister_path_selector(&hst_ps);
+
+	if (r < 0)
+		DMERR("unregister failed %d", r);
+}
+
+module_init(dm_hst_init);
+module_exit(dm_hst_exit);
+
+MODULE_DESCRIPTION(DM_NAME " measured service time oriented path selector");
+MODULE_AUTHOR("Khazhismel Kumykov <khazhy@google.com>");
+MODULE_LICENSE("GPL");
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

