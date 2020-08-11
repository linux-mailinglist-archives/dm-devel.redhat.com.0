Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 382DB2416E8
	for <lists+dm-devel@lfdr.de>; Tue, 11 Aug 2020 09:08:55 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-yV9e5fLiNgqKxSqiwPvtWA-1; Tue, 11 Aug 2020 03:08:51 -0400
X-MC-Unique: yV9e5fLiNgqKxSqiwPvtWA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53FCF101C8A9;
	Tue, 11 Aug 2020 07:08:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32DA5920CA;
	Tue, 11 Aug 2020 07:08:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E7943A552B;
	Tue, 11 Aug 2020 07:08:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07B3WmCE000945 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 23:32:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 55DF010F8E1C; Tue, 11 Aug 2020 03:32:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 512631009A09
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 03:32:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F542185A78B
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 03:32:45 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-33-zfky7xKmPIKC0K0rQSxHmA-1; Mon, 10 Aug 2020 23:32:38 -0400
X-MC-Unique: zfky7xKmPIKC0K0rQSxHmA-1
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 7CA587322A8E57DF8351;
	Tue, 11 Aug 2020 11:32:35 +0800 (CST)
Received: from [10.169.42.93] (10.169.42.93) by DGGEMS405-HUB.china.huawei.com
	(10.3.19.205) with Microsoft SMTP Server id 14.3.487.0;
	Tue, 11 Aug 2020 11:32:32 +0800
To: Mike Snitzer <snitzer@redhat.com>, Sagi Grimberg <sagi@grimberg.me>
References: <729820BC-5F38-4E22-A83A-862E57BAE201@netapp.com>
	<E3390A8E-D582-47BA-A085-21663D883365@netapp.com>
	<20200806184057.GA27858@redhat.com> <20200806191943.GA27868@redhat.com>
	<6B826235-C504-4621-B8F7-34475B200979@netapp.com>
	<20200807000755.GA28957@redhat.com>
	<510f5aff-0437-b1ce-f7ab-c812edbea880@grimberg.me>
	<20200807045015.GA29737@redhat.com>
	<fec745aa-0091-ee1f-cb0f-da9e18cf0aa2@grimberg.me>
	<20200810143620.GA19127@redhat.com> <20200810172209.GA19535@redhat.com>
From: Chao Leng <lengchao@huawei.com>
Message-ID: <7f99724a-a1eb-6bec-f8ae-f9a4601b0487@huawei.com>
Date: Tue, 11 Aug 2020 11:32:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200810172209.GA19535@redhat.com>
Content-Language: en-US
X-Originating-IP: [10.169.42.93]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 11 Aug 2020 03:08:22 -0400
Cc: "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Christoph Hellwig <hch@infradead.org>, dm-devel@redhat.com,
	Ewan Milne <emilne@redhat.com>, Keith Busch <kbusch@kernel.org>,
	"Meneghini, John" <John.Meneghini@netapp.com>
Subject: Re: [dm-devel] [PATCH] nvme: explicitly use normal NVMe error
 handling when appropriate
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit



On 2020/8/11 1:22, Mike Snitzer wrote:
> On Mon, Aug 10 2020 at 10:36am -0400,
> Mike Snitzer <snitzer@redhat.com> wrote:
> 
>> On Fri, Aug 07 2020 at  7:35pm -0400,
>> Sagi Grimberg <sagi@grimberg.me> wrote:
>>
>>>
>>>>> Hey Mike,
> ...
>>>> I think NVMe can easily fix this by having an earlier stage of checking,
>>>> e.g. nvme_local_retry_req(), that shortcircuits ever getting to
>>>> higher-level multipathing consideration (be it native NVMe or DM
>>>> multipathing) for cases like NVME_SC_CMD_INTERRUPTED.
>>>> To be clear: the "default" case of nvme_failover_req() that returns
>>>> false to fallback to NVMe's "local" normal NVMe error handling -- that
>>>> can stay.. but a more explicit handling of cases like
>>>> NVME_SC_CMD_INTERRUPTED should be added to a nvme_local_retry_req()
>>>> check that happens before nvme_failover_req() in nvme_complete_rq().
>>>
>>> I don't necessarily agree with having a dedicated nvme_local_retry_req().
>>> a request that isn't failed over, goes to local error handling (retry or
>>> not). I actually think that just adding the condition to
>>> nvme_complete_req and having nvme_failover_req reject it would work.
>>>
>>> Keith?
>>
>> I think that is basically what I'm thinking too.
> 
> From: Mike Snitzer <snitzer@redhat.com>
> Subject: nvme: explicitly use normal NVMe error handling when appropriate
> 
> Commit 764e9332098c0 ("nvme-multipath: do not reset on unknown
> status"), among other things, fixed NVME_SC_CMD_INTERRUPTED error
> handling by changing multipathing's nvme_failover_req() to short-circuit
> path failover and then fallback to NVMe's normal error handling (which
> takes care of NVME_SC_CMD_INTERRUPTED).
> 
> This detour through native NVMe multipathing code is unwelcome because
> it prevents NVMe core from handling NVME_SC_CMD_INTERRUPTED independent
> of any multipathing concerns.
> 
> Introduce nvme_status_needs_local_error_handling() to prioritize
> non-failover retry, when appropriate, in terms of normal NVMe error
> handling.  nvme_status_needs_local_error_handling() will naturely evolve
> to include handling of any other errors that normal error handling must
> be used for.
> 
> nvme_failover_req()'s ability to fallback to normal NVMe error handling
> has been preserved because it may be useful for future NVME_SC that
> nvme_status_needs_local_error_handling() hasn't yet been trained for.
> 
> Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> ---
>   drivers/nvme/host/core.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index 88cff309d8e4..be749b690af7 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -252,6 +252,16 @@ static inline bool nvme_req_needs_retry(struct request *req)
>   	return true;
>   }
>   
> +static inline bool nvme_status_needs_local_error_handling(u16 status)
> +{
> +	switch (status & 0x7ff) {
> +	case NVME_SC_CMD_INTERRUPTED:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>   static void nvme_retry_req(struct request *req)
>   {
>   	struct nvme_ns *ns = req->q->queuedata;
> @@ -270,7 +280,8 @@ static void nvme_retry_req(struct request *req)
>   
>   void nvme_complete_rq(struct request *req)
>   {
> -	blk_status_t status = nvme_error_status(nvme_req(req)->status);
> +	u16 nvme_status = nvme_req(req)->status;
> +	blk_status_t status = nvme_error_status(nvme_status);
>   
>   	trace_nvme_complete_rq(req);
>   
> @@ -280,7 +291,8 @@ void nvme_complete_rq(struct request *req)
>   		nvme_req(req)->ctrl->comp_seen = true;
>   
>   	if (unlikely(status != BLK_STS_OK && nvme_req_needs_retry(req))) {
> -		if ((req->cmd_flags & REQ_NVME_MPATH) && nvme_failover_req(req))
> +		if (!nvme_status_needs_local_error_handling(nvme_status) &&
> +		    (req->cmd_flags & REQ_NVME_MPATH) && nvme_failover_req(req))This looks no affect. if work with nvme multipath, now is already retry local.
If work with dm-multipath, still return error.
>   			return;
>   
>   		if (!blk_queue_dying(req->q)) {
> 

Suggest:
REQ_FAILFAST_TRANSPORT may be designed for scsi, because scsi protocol
do not difine the local retry mechanism. SCSI implements a fuzzy local
retry mechanism, so need the REQ_FAILFAST_TRANSPORT for multipath
software, multipath software retry according error code is expected.
nvme is different with scsi about this. It define local retry mechanism
and path error code, so nvme should not care REQ_FAILFAST_TRANSPORT.

Another, for nvme multipath, if the error code is not a path error,
multipath will not fail over to retry. but maybe blk_queue_dying return
true, IO can not be retry at current path, thus IO will interrupted.
blk_queue_dying and path error both need fail over to retry.

So we can do like this:
---
  drivers/nvme/host/core.c      | 26 +++++++++++++++++++-------
  drivers/nvme/host/multipath.c | 11 +++--------
  drivers/nvme/host/nvme.h      |  5 ++---
  include/linux/nvme.h          |  9 +++++++++
  4 files changed, 33 insertions(+), 18 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 4ee2330c603e..07471bd37f60 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -243,7 +243,7 @@ static blk_status_t nvme_error_status(u16 status)

  static inline bool nvme_req_needs_retry(struct request *req)
  {
-    if (blk_noretry_request(req))
+    if (req->cmd_flags & (REQ_FAILFAST_DEV | REQ_FAILFAST_DRIVER))
          return false;
      if (nvme_req(req)->status & NVME_SC_DNR)
          return false;
@@ -252,6 +252,14 @@ static inline bool nvme_req_needs_retry(struct request *req)
      return true;
  }

+static inline bool nvme_req_path_error(struct request *req)
+{
+    if ((nvme_req(req)->status & NVME_SCT_MASK) == NVME_SCT_PATH ||
+        blk_queue_dying(req->q))
+        return true;
+    return false;
+}
+
  static void nvme_retry_req(struct request *req)
  {
      struct nvme_ns *ns = req->q->queuedata;
@@ -270,7 +278,7 @@ static void nvme_retry_req(struct request *req)

  void nvme_complete_rq(struct request *req)
  {
-    blk_status_t status = nvme_error_status(nvme_req(req)->status);
+    blk_status_t status;

      trace_nvme_complete_rq(req);

@@ -279,16 +287,20 @@ void nvme_complete_rq(struct request *req)
      if (nvme_req(req)->ctrl->kas)
          nvme_req(req)->ctrl->comp_seen = true;

-    if (unlikely(status != BLK_STS_OK && nvme_req_needs_retry(req))) {
-        if ((req->cmd_flags & REQ_NVME_MPATH) && nvme_failover_req(req))
-            return;
-
-        if (!blk_queue_dying(req->q)) {
+    if (unlikely(nvme_req(req)->status != NVME_SC_SUCCESS &&
+        nvme_req_needs_retry(req))) {
+        if (nvme_req_path_error(req)) {
+            if (req->cmd_flags & REQ_NVME_MPATH) {
+                nvme_failover_req(req);
+                return;
+            }
+        } else {
              nvme_retry_req(req);
              return;
          }
      }

+    status = nvme_error_status(nvme_req(req)->status);
      nvme_trace_bio_complete(req, status);
      blk_mq_end_request(req, status);
  }
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 66509472fe06..e182fb3bcd0c 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -65,7 +65,7 @@ void nvme_set_disk_name(char *disk_name, struct nvme_ns *ns,
      }
  }

-bool nvme_failover_req(struct request *req)
+void nvme_failover_req(struct request *req)
  {
      struct nvme_ns *ns = req->q->queuedata;
      u16 status = nvme_req(req)->status;
@@ -90,17 +90,13 @@ bool nvme_failover_req(struct request *req)
              queue_work(nvme_wq, &ns->ctrl->ana_work);
          }
          break;
-    case NVME_SC_HOST_PATH_ERROR:
-    case NVME_SC_HOST_ABORTED_CMD:
+    default:
          /*
-         * Temporary transport disruption in talking to the controller.
+         * Normal error path.
           * Try to send on a new path.
           */
          nvme_mpath_clear_current_path(ns);
          break;
-    default:
-        /* This was a non-ANA error so follow the normal error path. */
-        return false;
      }

      spin_lock_irqsave(&ns->head->requeue_lock, flags);
@@ -109,7 +105,6 @@ bool nvme_failover_req(struct request *req)
      blk_mq_end_request(req, 0);

      kblockd_schedule_work(&ns->head->requeue_work);
-    return true;
  }

  void nvme_kick_requeue_lists(struct nvme_ctrl *ctrl)
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 09ffc3246f60..cbb5d4ba6241 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -582,7 +582,7 @@ void nvme_mpath_wait_freeze(struct nvme_subsystem *subsys);
  void nvme_mpath_start_freeze(struct nvme_subsystem *subsys);
  void nvme_set_disk_name(char *disk_name, struct nvme_ns *ns,
              struct nvme_ctrl *ctrl, int *flags);
-bool nvme_failover_req(struct request *req);
+void nvme_failover_req(struct request *req);
  void nvme_kick_requeue_lists(struct nvme_ctrl *ctrl);
  int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl,struct nvme_ns_head *head);
  void nvme_mpath_add_disk(struct nvme_ns *ns, struct nvme_id_ns *id);
@@ -640,9 +640,8 @@ static inline void nvme_set_disk_name(char *disk_name, struct nvme_ns *ns,
      sprintf(disk_name, "nvme%dn%d", ctrl->instance, ns->head->instance);
  }

-static inline bool nvme_failover_req(struct request *req)
+static inline void nvme_failover_req(struct request *req)
  {
-    return false;
  }
  static inline void nvme_kick_requeue_lists(struct nvme_ctrl *ctrl)
  {
diff --git a/include/linux/nvme.h b/include/linux/nvme.h
index 5ce51ab4c50e..8c4a5b4d5b4d 100644
--- a/include/linux/nvme.h
+++ b/include/linux/nvme.h
@@ -1441,6 +1441,15 @@ enum {
      NVME_SC_DNR            = 0x4000,
  };

+#define NVME_SCT_MASK 0x700
+enum {
+    NVME_SCT_GENERIC = 0,
+    NVME_SCT_COMMAND_SPECIFIC = 0x100,
+    NVME_SCT_MEDIA = 0x200,
+    NVME_SCT_PATH = 0x300,
+    NVME_SCT_VENDOR = 0x700
+};
+
  struct nvme_completion {
      /*
       * Used by Admin and Fabrics commands to return data:
-- 
2.16.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

