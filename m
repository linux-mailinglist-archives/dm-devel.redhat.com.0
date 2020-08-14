Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id ECE0A24452D
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 09:04:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-3oaK-HkhNAW_uJz60izhbA-1; Fri, 14 Aug 2020 03:04:47 -0400
X-MC-Unique: 3oaK-HkhNAW_uJz60izhbA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CCC210082E0;
	Fri, 14 Aug 2020 07:04:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AE3F100AE5D;
	Fri, 14 Aug 2020 07:04:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DBB9A180C5A2;
	Fri, 14 Aug 2020 07:04:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07E4QedI022180 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 14 Aug 2020 00:26:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 23F0C202278F; Fri, 14 Aug 2020 04:26:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E6902017F06
	for <dm-devel@redhat.com>; Fri, 14 Aug 2020 04:26:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0310B800260
	for <dm-devel@redhat.com>; Fri, 14 Aug 2020 04:26:38 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-565-7MqSt5PbMdqgjqH_2tOtLQ-1; Fri, 14 Aug 2020 00:26:33 -0400
X-MC-Unique: 7MqSt5PbMdqgjqH_2tOtLQ-1
Received: from BN8PR06MB5714.namprd06.prod.outlook.com (20.179.140.160) by
	BN7PR06MB4082.namprd06.prod.outlook.com (52.132.5.10) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.3283.15; Fri, 14 Aug 2020 04:26:30 +0000
Received: from BN8PR06MB5714.namprd06.prod.outlook.com
	([fe80::9438:86ca:efca:18b9]) by
	BN8PR06MB5714.namprd06.prod.outlook.com
	([fe80::9438:86ca:efca:18b9%3]) with mapi id 15.20.3283.018;
	Fri, 14 Aug 2020 04:26:30 +0000
From: "Meneghini, John" <John.Meneghini@netapp.com>
To: Christoph Hellwig <hch@infradead.org>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [RESEND PATCH] nvme: explicitly use normal NVMe error handling
	when appropriate
Thread-Index: AQHWcYDS3N6K/RiKVU6UaUdcYydCWqk2K/2AgAAkgwCAAA/bgIAAX76A
Date: Fri, 14 Aug 2020 04:26:29 +0000
Message-ID: <7A5B9516-373E-41A3-94F8-5ED16BB968CE@netapp.com>
References: <6B826235-C504-4621-B8F7-34475B200979@netapp.com>
	<20200807000755.GA28957@redhat.com>
	<510f5aff-0437-b1ce-f7ab-c812edbea880@grimberg.me>
	<20200807045015.GA29737@redhat.com>
	<fec745aa-0091-ee1f-cb0f-da9e18cf0aa2@grimberg.me>
	<20200810143620.GA19127@redhat.com> <20200810172209.GA19535@redhat.com>
	<20200813144811.GA5452@redhat.com>
	<20200813153623.GA30905@infradead.org>
	<20200813174704.GA6137@redhat.com>
	<20200813184349.GA8191@infradead.org>
In-Reply-To: <20200813184349.GA8191@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.39.20071300
x-originating-ip: [216.240.30.25]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c953dad-d3b1-413a-3d71-08d8400a37a4
x-ms-traffictypediagnostic: BN7PR06MB4082:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR06MB408276D712902FF3B7C722A2E4400@BN7PR06MB4082.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BN8PR06MB5714.namprd06.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(6486002)(86362001)(36756003)(54906003)(53546011)(2616005)(6506007)(33656002)(8936002)(2906002)(4326008)(110136005)(316002)(6512007)(8676002)(83380400001)(107886003)(76116006)(66446008)(64756008)(186003)(66476007)(71200400001)(91956017)(5660300002)(66946007)(66556008)(478600001)(26005);
	DIR:OUT; SFP:1101;
Content-ID: <66C07CD1A8013D478B4CAB755053F779@namprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: netapp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR06MB5714.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c953dad-d3b1-413a-3d71-08d8400a37a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2020 04:26:29.8907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b0911a0-929b-4715-944b-c03745165b3a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D2xwAOZ9Cl47hHxxeWa6jX8tOna8l0UyQUAhpMvq7C/Vf7aMEc4JXqTms9FEi6oRCvJKkoFZCd2KOE9ZHKN7WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR06MB4082
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07E4QedI022180
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 14 Aug 2020 03:04:01 -0400
Cc: Sagi Grimberg <sagi@grimberg.me>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Ewan Milne <emilne@redhat.com>, Chao Leng <lengchao@huawei.com>,
	Busch <kbusch@kernel.org>, "Meneghini,
	John" <John.Meneghini@netapp.com>, Keith
Subject: Re: [dm-devel] [RESEND PATCH] nvme: explicitly use normal NVMe
 error handling when appropriate
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.004
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 8/13/20, 2:44 PM, "Christoph Hellwig" <hch@infradead.org> wrote:

    On Thu, Aug 13, 2020 at 01:47:04PM -0400, Mike Snitzer wrote:
    > This is just a tweak to improve the high-level fault tree of core NVMe
    > error handling.  No functional change, but for such basic errors,
    > avoiding entering nvme_failover_req is meaningful on a code flow level.
    > Makes code to handle errors that need local retry clearer by being more
    > structured, less circuitous.
  
I don't understand how entering nvme_failover_req() is circuitous. 

This code path is only taken if REQ_NVME_MPATH is set which - unless I am mistaken - in
the case that you care about it will not be set.

    > Allows NVMe core's handling of such errors to be more explicit and live
    > in core.c rather than multipath.c -- so things like ACRE handling can be
    > made explicitly part of core and not nested under nvme_failover_req's
    > relatively obscure failsafe that returns false for anything it doesn't
    > care about.

The ACRE handling is already explicitly a part of the core.  I don't understand what
you are after here Mike.  Are you saying that you don't want the ACRE code to run
when REQ_NVME_MPATH is clear?

    If we're going that way I'd rather do something like the (untested)
    patch below that adds a dispostion function with a function that
    decides it and then just switches on it:

Christoph, it looks like you've moved a lot of stuff around here, with no actual
functional change.... but it's really hard for me to tell.  Please be sure to cc me if this
becomes a real patch.

How does your patch solve the problem of making dm-multipath work with command retries?

Mike, do you want the nvme-core driver to retry commands on the same path, with CRD, for the dm-multipath
use case... or are you looking for a different treatment of REQ_FAILFAST_DEV... or what? 

Maybe I'm not seeing it.

/John

    diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
    index 88cff309d8e4f0..a740320f0d4ee7 100644
    --- a/drivers/nvme/host/core.c
    +++ b/drivers/nvme/host/core.c
    @@ -241,17 +241,6 @@ static blk_status_t nvme_error_status(u16 status)
            }
     }

    -static inline bool nvme_req_needs_retry(struct request *req)
    -{
    -       if (blk_noretry_request(req))
    -               return false;
    -       if (nvme_req(req)->status & NVME_SC_DNR)
    -               return false;
    -       if (nvme_req(req)->retries >= nvme_max_retries)
    -               return false;
    -       return true;
    -}
    -
     static void nvme_retry_req(struct request *req)
     {
            struct nvme_ns *ns = req->q->queuedata;
    @@ -268,33 +257,75 @@ static void nvme_retry_req(struct request *req)
            blk_mq_delay_kick_requeue_list(req->q, delay);
     }

    -void nvme_complete_rq(struct request *req)
    +enum nvme_disposition {
    +       COMPLETE,
    +       RETRY,
    +       REDIRECT_ANA,
    +       REDIRECT_TMP,
    +};
    +
    +static inline enum nvme_disposition nvme_req_disposition(struct request *req)
    +{
    +       if (likely(nvme_req(req)->status == 0))
    +               return COMPLETE;
    +
    +       if (blk_noretry_request(req) ||
    +           (nvme_req(req)->status & NVME_SC_DNR) ||
    +           nvme_req(req)->retries >= nvme_max_retries)
    +               return COMPLETE;
    +
    +       if (req->cmd_flags & REQ_NVME_MPATH) {
    +               switch (nvme_req(req)->status & 0x7ff) {
    +               case NVME_SC_ANA_TRANSITION:
    +               case NVME_SC_ANA_INACCESSIBLE:
    +               case NVME_SC_ANA_PERSISTENT_LOSS:
    +                       return REDIRECT_ANA;
    +               case NVME_SC_HOST_PATH_ERROR:
    +               case NVME_SC_HOST_ABORTED_CMD:
    +                       return REDIRECT_TMP;
    +               }
    +       }
    +
    +       if (blk_queue_dying(req->q))
    +               return COMPLETE;
    +       return RETRY;
    +}
    +
    +static inline void nvme_complete_req(struct request *req)
     {
            blk_status_t status = nvme_error_status(nvme_req(req)->status);

    -       trace_nvme_complete_rq(req);
    +       if (IS_ENABLED(CONFIG_BLK_DEV_ZONED) &&
    +           req_op(req) == REQ_OP_ZONE_APPEND)
    +               req->__sector = nvme_lba_to_sect(req->q->queuedata,
    +                       le64_to_cpu(nvme_req(req)->result.u64));
    +
    +       nvme_trace_bio_complete(req, status);
    +       blk_mq_end_request(req, status);
    +}

    +void nvme_complete_rq(struct request *req)
    +{
    +       trace_nvme_complete_rq(req);
            nvme_cleanup_cmd(req);

            if (nvme_req(req)->ctrl->kas)
                    nvme_req(req)->ctrl->comp_seen = true;

    -       if (unlikely(status != BLK_STS_OK && nvme_req_needs_retry(req))) {
    -               if ((req->cmd_flags & REQ_NVME_MPATH) && nvme_failover_req(req))
    -                       return;
    -
    -               if (!blk_queue_dying(req->q)) {
    -                       nvme_retry_req(req);
    -                       return;
    -               }
    -       } else if (IS_ENABLED(CONFIG_BLK_DEV_ZONED) &&
    -                  req_op(req) == REQ_OP_ZONE_APPEND) {
    -               req->__sector = nvme_lba_to_sect(req->q->queuedata,
    -                       le64_to_cpu(nvme_req(req)->result.u64));
    +       switch (nvme_req_disposition(req)) {
    +       case COMPLETE:
    +               nvme_complete_req(req);
    +               return;
    +       case RETRY:
    +               nvme_retry_req(req);
    +               return;
    +       case REDIRECT_ANA:
    +               nvme_failover_req(req, true);
    +               return;
    +       case REDIRECT_TMP:
    +               nvme_failover_req(req, false);
    +               return;
            }
    -
    -       nvme_trace_bio_complete(req, status);
    -       blk_mq_end_request(req, status);
     }
     EXPORT_SYMBOL_GPL(nvme_complete_rq);

    diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
    index 3ded54d2c9c6ad..0c22b2c88687a2 100644
    --- a/drivers/nvme/host/multipath.c
    +++ b/drivers/nvme/host/multipath.c
    @@ -65,51 +65,32 @@ void nvme_set_disk_name(char *disk_name, struct nvme_ns *ns,
            }
     }

    -bool nvme_failover_req(struct request *req)
    +void nvme_failover_req(struct request *req, bool is_ana_status)
     {
            struct nvme_ns *ns = req->q->queuedata;
    -       u16 status = nvme_req(req)->status;
            unsigned long flags;

    -       switch (status & 0x7ff) {
    -       case NVME_SC_ANA_TRANSITION:
    -       case NVME_SC_ANA_INACCESSIBLE:
    -       case NVME_SC_ANA_PERSISTENT_LOSS:
    -               /*
    -                * If we got back an ANA error we know the controller is alive,
    -                * but not ready to serve this namespaces.  The spec suggests
    -                * we should update our general state here, but due to the fact
    -                * that the admin and I/O queues are not serialized that is
    -                * fundamentally racy.  So instead just clear the current path,
    -                * mark the the path as pending and kick of a re-read of the ANA
    -                * log page ASAP.
    -                */
    -               nvme_mpath_clear_current_path(ns);
    -               if (ns->ctrl->ana_log_buf) {
    -                       set_bit(NVME_NS_ANA_PENDING, &ns->flags);
    -                       queue_work(nvme_wq, &ns->ctrl->ana_work);
    -               }
    -               break;
    -       case NVME_SC_HOST_PATH_ERROR:
    -       case NVME_SC_HOST_ABORTED_CMD:
    -               /*
    -                * Temporary transport disruption in talking to the controller.
    -                * Try to send on a new path.
    -                */
    -               nvme_mpath_clear_current_path(ns);
    -               break;
    -       default:
    -               /* This was a non-ANA error so follow the normal error path. */
    -               return false;
    +       nvme_mpath_clear_current_path(ns);
    +
    +       /*
    +        * If we got back an ANA error we know the controller is alive, but not
    +        * ready to serve this namespaces.  The spec suggests we should update
    +        * our general state here, but due to the fact that the admin and I/O
    +        * queues are not serialized that is fundamentally racy.  So instead
    +        * just clear the current path, mark the the path as pending and kick
    +        * of a re-read of the ANA log page ASAP.
    +        */
    +       if (is_ana_status && ns->ctrl->ana_log_buf) {
    +               set_bit(NVME_NS_ANA_PENDING, &ns->flags);
    +               queue_work(nvme_wq, &ns->ctrl->ana_work);
            }

            spin_lock_irqsave(&ns->head->requeue_lock, flags);
            blk_steal_bios(&ns->head->requeue_list, req);
            spin_unlock_irqrestore(&ns->head->requeue_lock, flags);
    -       blk_mq_end_request(req, 0);

    +       blk_mq_end_request(req, 0);
            kblockd_schedule_work(&ns->head->requeue_work);
    -       return true;
     }

     void nvme_kick_requeue_lists(struct nvme_ctrl *ctrl)
    diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
    index ebb8c3ed388554..aeff1c491ac2ef 100644
    --- a/drivers/nvme/host/nvme.h
    +++ b/drivers/nvme/host/nvme.h
    @@ -629,7 +629,7 @@ void nvme_mpath_wait_freeze(struct nvme_subsystem *subsys);
     void nvme_mpath_start_freeze(struct nvme_subsystem *subsys);
     void nvme_set_disk_name(char *disk_name, struct nvme_ns *ns,
                            struct nvme_ctrl *ctrl, int *flags);
    -bool nvme_failover_req(struct request *req);
    +void nvme_failover_req(struct request *req, bool is_ana_status);
     void nvme_kick_requeue_lists(struct nvme_ctrl *ctrl);
     int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl,struct nvme_ns_head *head);
     void nvme_mpath_add_disk(struct nvme_ns *ns, struct nvme_id_ns *id);
    @@ -688,9 +688,8 @@ static inline void nvme_set_disk_name(char *disk_name, struct nvme_ns *ns,
            sprintf(disk_name, "nvme%dn%d", ctrl->instance, ns->head->instance);
     }

    -static inline bool nvme_failover_req(struct request *req)
    +static inline void nvme_failover_req(struct request *req, bool is_ana_status)
     {
    -       return false;
     }
     static inline void nvme_kick_requeue_lists(struct nvme_ctrl *ctrl)
     {


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

