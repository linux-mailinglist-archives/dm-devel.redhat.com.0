Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EE31224453D
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 09:08:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-qlbEGLnsPAOH6tmFn18BBQ-1; Fri, 14 Aug 2020 03:07:23 -0400
X-MC-Unique: qlbEGLnsPAOH6tmFn18BBQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4A431DDE1;
	Fri, 14 Aug 2020 07:07:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93FD96FDA4;
	Fri, 14 Aug 2020 07:07:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 54BA2181A270;
	Fri, 14 Aug 2020 07:07:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07E3NvNR014549 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 23:23:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 80ACC2166BA4; Fri, 14 Aug 2020 03:23:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B6072166BA3
	for <dm-devel@redhat.com>; Fri, 14 Aug 2020 03:23:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A1C485A5A5
	for <dm-devel@redhat.com>; Fri, 14 Aug 2020 03:23:55 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-547-ziuCZwqGMEm2agjZw4474A-1; Thu, 13 Aug 2020 23:23:50 -0400
X-MC-Unique: ziuCZwqGMEm2agjZw4474A-1
Received: from BN8PR06MB5714.namprd06.prod.outlook.com (2603:10b6:408:d2::32)
	by BN6PR06MB3331.namprd06.prod.outlook.com (2603:10b6:405:3d::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15;
	Fri, 14 Aug 2020 03:23:47 +0000
Received: from BN8PR06MB5714.namprd06.prod.outlook.com
	([fe80::9438:86ca:efca:18b9]) by
	BN8PR06MB5714.namprd06.prod.outlook.com
	([fe80::9438:86ca:efca:18b9%3]) with mapi id 15.20.3283.018;
	Fri, 14 Aug 2020 03:23:47 +0000
From: "Meneghini, John" <John.Meneghini@netapp.com>
To: Mike Snitzer <snitzer@redhat.com>, Sagi Grimberg <sagi@grimberg.me>
Thread-Topic: [RESEND PATCH] nvme: explicitly use normal NVMe error handling
	when appropriate
Thread-Index: AQHWcYDS3N6K/RiKVU6UaUdcYydCWqk2rpSA
Date: Fri, 14 Aug 2020 03:23:47 +0000
Message-ID: <FE38832C-9966-4455-BE4D-74745AD1AEB1@netapp.com>
References: <E3390A8E-D582-47BA-A085-21663D883365@netapp.com>
	<20200806184057.GA27858@redhat.com> <20200806191943.GA27868@redhat.com>
	<6B826235-C504-4621-B8F7-34475B200979@netapp.com>
	<20200807000755.GA28957@redhat.com>
	<510f5aff-0437-b1ce-f7ab-c812edbea880@grimberg.me>
	<20200807045015.GA29737@redhat.com>
	<fec745aa-0091-ee1f-cb0f-da9e18cf0aa2@grimberg.me>
	<20200810143620.GA19127@redhat.com> <20200810172209.GA19535@redhat.com>
	<20200813144811.GA5452@redhat.com>
In-Reply-To: <20200813144811.GA5452@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.39.20071300
x-originating-ip: [216.240.30.25]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bf8c35b-bd3f-4069-f9d6-08d840017513
x-ms-traffictypediagnostic: BN6PR06MB3331:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR06MB33318182D8A0D2ED9B1DFC92E4400@BN6PR06MB3331.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nzZL1wFZdoIdTKA2yjclEiBGZzOzvPakdQP4iIyrn2IzoCKQn/wKlGhAneHv3em8N3yk1mEgf4bNS9ELFuaje0eIkBj0Jjtu4TsJC7Nm4DzVTV0GmcGUBmTYErwWr5bAy9knxgrF0JnLMtvUZtIVQL8uRuuv/W5lao18gMyk8iXMAZcDNr3sK8IMwGmFuukANTeXELTZBS7qcBpzq172knUsTQU7bZa1EtVVFbachS7lVLrdc8PKvn8ba8NRdtCovNuwwox/66JcHUqH9ANa7pSyTlW9aUa21tFZqWVzHjKB8xNvclzVlkSNGTie+2SXdYDAmWigidGJuj45ULI+BA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BN8PR06MB5714.namprd06.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(2616005)(53546011)(6512007)(186003)(478600001)(4326008)(316002)(6506007)(5660300002)(107886003)(8936002)(6486002)(2906002)(71200400001)(64756008)(66446008)(66556008)(66476007)(8676002)(91956017)(76116006)(66946007)(83380400001)(54906003)(36756003)(86362001)(110136005)(33656002)(26005);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: 1IqT/Wu7mJADbftWaJVvtkVosap06bc+sNBMev+wrYz86qrvEphEXKPib3ShIqDWG2CnLxKIBCAao+9bifLN9OPU7U56UXvEYYYg+XmqNao5L+1OVokuVlPgTWWoCWKc8qzSchhiL4YtPKk7O/S/oElUrliAkj+MBTF13WUIqe6vftL0mGbECPb07DlDKkS6j2DY8i9MWNym2maPjQPRcS0dr3okup/F+2thJBRdLgbLyM9xT06/Kw+ugli0l8O1jww7j9mLuhPvW3AXY01gAiAIiomVntfJut7kvphAPvohGtdVQnhe22w8YSE3ra915E+tGG3vMu7vmAT1kD/Xbneo09wR5X6/wKarML/aKch5IoHsAICeL1CYx7cnLi91iIb5EF+uo+ffnnTkJo9+3+FrIv0c7yulIS+CWbVUD0mzue8MVq+Gz1vLc/WjQKLHzhOX89HdetD/ZyYXOgYWCByYlCypPqvejFRIFnQIwM+4/Vi0kwdT6S8W1XOAF9ijG10otioF99l+gntZ5ltLCGRUeUHMMZk+XH/KKI5f8HthoGa5X6jbyuiUCXDupFqLT//7jivVl5y+++NaJpj0o2U2B4cIxXTpMVwUUeI7gWnSvhx6BRx5wOwH2yYgA3/vtqh9dcevcffDbttSNudgGw==
Content-ID: <54BD68F19977E84E8DFC5E2383C18431@namprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: netapp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR06MB5714.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf8c35b-bd3f-4069-f9d6-08d840017513
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2020 03:23:47.5484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b0911a0-929b-4715-944b-c03745165b3a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QWK1Or6+eYV10YpnuQ8k5nsoayIGGMSfgCDGhpVjdN62yfg1kKKzzkfDM3se0GNyx40oVTue1JMcqGj5KYCCew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR06MB3331
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07E3NvNR014549
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 14 Aug 2020 03:04:01 -0400
Cc: "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Chao Leng <lengchao@huawei.com>, Keith Busch <kbusch@kernel.org>,
	"Meneghini, 
	John" <John.Meneghini@netapp.com>, Ewan Milne <emilne@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.004
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 8/13/20, 10:48 AM, "Mike Snitzer" <snitzer@redhat.com> wrote:

    Commit 764e9332098c0 ("nvme-multipath: do not reset on unknown
    status"), among other things, fixed NVME_SC_CMD_INTERRUPTED error
    handling by changing multipathing's nvme_failover_req() to short-circuit
    path failover and then fallback to NVMe's normal error handling (which
    takes care of NVME_SC_CMD_INTERRUPTED).

    This detour through native NVMe multipathing code is unwelcome because
    it prevents NVMe core from handling NVME_SC_CMD_INTERRUPTED independent
    of any multipathing concerns.

    Introduce nvme_status_needs_local_error_handling() to prioritize
    non-failover retry, when appropriate, in terms of normal NVMe error
    handling.  nvme_status_needs_local_error_handling() will naturely evolve
    to include handling of any other errors that normal error handling must
    be used for.

How is this any better than blk_path_error()? 

    nvme_failover_req()'s ability to fallback to normal NVMe error handling
    has been preserved because it may be useful for future NVME_SC that
    nvme_status_needs_local_error_handling() hasn't been trained for yet.

    Signed-off-by: Mike Snitzer <snitzer@redhat.com>
    ---
     drivers/nvme/host/core.c | 16 ++++++++++++++--
     1 file changed, 14 insertions(+), 2 deletions(-)

    diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
    index 88cff309d8e4..be749b690af7 100644
    --- a/drivers/nvme/host/core.c
    +++ b/drivers/nvme/host/core.c
    @@ -252,6 +252,16 @@ static inline bool nvme_req_needs_retry(struct request *req)
            return true;
     }

    +static inline bool nvme_status_needs_local_error_handling(u16 status)
    +{
    +       switch (status & 0x7ff) {
    +       case NVME_SC_CMD_INTERRUPTED:
    +               return true;
    +       default:
    +               return false;
    +       }
    +}

I assume that what you mean by nvme_status_needs_local_error_handling is - do you want the nvme core 
driver to handle the command retry.

If this is true, I don't think this function will ever work correctly because,. as discussed, whether or
not the command needs to be retried has nothing to do with the NVMe Status Code Field itself, it
has to so with the DNR bit, the CRD field, and the Status Code Type field - in that order.

    +
     static void nvme_retry_req(struct request *req)
     {
            struct nvme_ns *ns = req->q->queuedata;
    @@ -270,7 +280,8 @@ static void nvme_retry_req(struct request *req)

     void nvme_complete_rq(struct request *req)
     {
    -       blk_status_t status = nvme_error_status(nvme_req(req)->status);
    +       u16 nvme_status = nvme_req(req)->status;
    +       blk_status_t status = nvme_error_status(nvme_status);

            trace_nvme_complete_rq(req);

    @@ -280,7 +291,8 @@ void nvme_complete_rq(struct request *req)
                    nvme_req(req)->ctrl->comp_seen = true;

            if (unlikely(status != BLK_STS_OK && nvme_req_needs_retry(req))) {
    -               if ((req->cmd_flags & REQ_NVME_MPATH) && nvme_failover_req(req))
    +               if (!nvme_status_needs_local_error_handling(nvme_status) &&

This defeats the nvme-multipath logic by inserting  a second evaluation of the NVMe Status Code into the retry logic.

This is basically another version of  blk_path_error().

In fact, in your case REQ_NVME_MPATH is probably not set, so I don't see what difference this would make at all.

/John

    +                   (req->cmd_flags & REQ_NVME_MPATH) && nvme_failover_req(req))
                            return;

                    if (!blk_queue_dying(req->q)) {
    --
    2.18.0



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

