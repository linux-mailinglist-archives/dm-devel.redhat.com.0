Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D2312EF4AE
	for <lists+dm-devel@lfdr.de>; Tue,  5 Nov 2019 06:09:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572930595;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=hduBuwcajmoqPgzYoyVAclxDQeJ091q55PPJBPvv10M=;
	b=PTsTH+SAc9gEviyeuKM3N5ZnxTaefKjJzn7rNzyfU2z9/DIoz0KYuK6jRhkldeaQRfDn8Y
	E3pDadWQBE4TSb9eZaUrT+HmnuBTJXWZ9NrssIdeKc5rqpBDdbdrrNyhDaPTSNqLIAiWKX
	pEcQPKM8QSPoJNHH5kMfrTCnTxaVxTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-Wf_wlhHlOQy7UeaqIQCcYA-1; Tue, 05 Nov 2019 00:09:53 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1E87801FCD;
	Tue,  5 Nov 2019 05:09:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD6B95D9CD;
	Tue,  5 Nov 2019 05:09:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 94CF54BB65;
	Tue,  5 Nov 2019 05:09:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA559X5B009646 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 5 Nov 2019 00:09:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 73678608B6; Tue,  5 Nov 2019 05:09:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx25.extmail.prod.ext.phx2.redhat.com
	[10.5.110.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 939C2608B4;
	Tue,  5 Nov 2019 05:09:27 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7F99710C092A;
	Tue,  5 Nov 2019 05:08:59 +0000 (UTC)
IronPort-SDR: 8jABEnZvoT/eli272uBmoEVZQOVxsfL3Tlx1rZtjAEArgk/E8sdLTT4csK5KMOZF9dUQ4xfon1
	hIiwDgcipl/5We22EtsCgX7kvOjAg2EHc2wCUO381zVgBMQ45/3kCUO+uTglVN5lWm7t7UfyDx
	wEGCRsMefQIP+ev4q/DODUtnenAtarcturJsx/I4vVEYm9fhe87EUuHJ8+JSgJKpK/KjOzB0cO
	Go1D79E1CR6cXlUCxMeGsA9BiucPfzJrF9YevYHpuGCFdmUsTuQ52z8X2YmrElysnJ8PuP8u7m
	SXg=
X-IronPort-AV: E=Sophos;i="5.68,270,1569254400"; d="scan'208";a="123733967"
Received: from mail-co1nam03lp2050.outbound.protection.outlook.com (HELO
	NAM03-CO1-obe.outbound.protection.outlook.com) ([104.47.40.50])
	by ob1.hgst.iphmx.com with ESMTP; 05 Nov 2019 13:08:36 +0800
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
	BYAPR04MB5126.namprd04.prod.outlook.com (52.135.234.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Tue, 5 Nov 2019 05:08:33 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::4176:5eda:76a2:3c40]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::4176:5eda:76a2:3c40%7]) with mapi id 15.20.2408.024;
	Tue, 5 Nov 2019 05:08:33 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Thread-Topic: [PATCH 0/8] Zone management commands support
Thread-Index: AQHVjM+oAfCMB+wY1ka3IBKYRZIZ0Q==
Date: Tue, 5 Nov 2019 05:08:33 +0000
Message-ID: <BYAPR04MB58164F042DA0D67A3FC21686E77E0@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20191027140549.26272-1-damien.lemoal@wdc.com>
	<926948c1-d9a0-4156-4639-bbac1d0ba10b@kernel.dk>
	<BYAPR04MB5816539DCBED2D2C93254D36E77C0@BYAPR04MB5816.namprd04.prod.outlook.com>
	<yq1r22n3ozf.fsf@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 440b03a1-960a-443a-b387-08d761ae34de
x-ms-traffictypediagnostic: BYAPR04MB5126:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB5126E00E040999E87E05E9D6E77E0@BYAPR04MB5126.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 0212BDE3BE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(199004)(189003)(8936002)(71190400001)(446003)(2906002)(76176011)(305945005)(476003)(229853002)(53546011)(6436002)(4326008)(55016002)(7696005)(558084003)(3846002)(486006)(6116002)(54906003)(6506007)(74316002)(33656002)(316002)(9686003)(6246003)(25786009)(6916009)(66066001)(26005)(186003)(256004)(71200400001)(99286004)(102836004)(7736002)(66446008)(66556008)(66476007)(91956017)(64756008)(478600001)(14454004)(66946007)(76116006)(5660300002)(81166006)(52536014)(81156014)(8676002)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5126;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nBc3sxM1DUQJPVH/rN1WNIUDd/1W4xrl8rsc2KDFD4JrwusBntCchfvFhkWCjjmtQuRy/8VTAFoAajYrMknYoZVBDpRo/FZCTD/SPajN3+vA7M54mMgnVCU5F7lGn2OSVbIIxx7e9N+OH4gdeNk7AZX2Bmw7papzGPo06mwIa06XQP7EERhLc2hdlaNwYnpiQ8l8c7iK8MJgEB/5UrCWLpbErJhwwuX/MX6rBAXaUOreUFfGDdQJmoWXjiHWT/GHOjn4BMn+ZaPxO3lBUvbO5DWWSQE755R78k38zlWFzhDxPoR+ekPASQjyVrUiI5wc4Zc66o//p7/vJq2MfsWZUQPgdzvWM+r8z1Duro8HNDKS5C9ElYLy8Jt+Cj0pFkeInInOEgBbjF5f6hQKXcKAsa1ifBpBlsegOUmHS7TyxvNvNl5iB9cq/lcsSQKpn9Ib
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 440b03a1-960a-443a-b387-08d761ae34de
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2019 05:08:33.3989 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bExQhkTvdTcnDvjOC9Mjkp7q7csP1JzhdyRFQsW1ZVnI+iar04zpqnHZQR85IRuD+tF0wF4CYbiOb1rdAu/6Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5126
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.66]); Tue, 05 Nov 2019 05:09:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]);
	Tue, 05 Nov 2019 05:09:16 +0000 (UTC) for IP:'216.71.154.45'
	DOMAIN:'esa6.hgst.iphmx.com' HELO:'esa6.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.45 esa6.hgst.iphmx.com
	216.71.154.45 esa6.hgst.iphmx.com
	<prvs=20536ca63=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.66
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xA559X5B009646
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Ajay Joshi <Ajay.Joshi@wdc.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
	Hans Holmberg <Hans.Holmberg@wdc.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Keith Busch <kbusch@kernel.org>, Bjorling <Matias.Bjorling@wdc.com>, Matias
Subject: Re: [dm-devel] [PATCH 0/8] Zone management commands support
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
X-MC-Unique: Wf_wlhHlOQy7UeaqIQCcYA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2019/11/05 13:53, Martin K. Petersen wrote:
> 
> Damien,
> 
>> Can you take patch 3 now ?
> 
> Yep. Applied to 5.4/scsi-fixes.

Thanks !


-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

