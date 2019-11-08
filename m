Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id ABE8DF7144
	for <lists+dm-devel@lfdr.de>; Mon, 11 Nov 2019 10:58:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573466327;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=a/3oPCU0Zm+DIiloRB8iYxVdRkzdntKXg4WcQ3RMu8Q=;
	b=FxXQGAT+vzthFUpZXNEEVYiHEAechR9qSYao5LodrolZhv4/Gcjl7DDsZ3Zg6BKk+cAU31
	qd6tLDqjJzNoH9U+DZTluyey1TbwsScUi1Lh61MrqwNUFIKLFxp1I4NHmH0Lbv70ZNKHd9
	S0dSd6pOQfmZnHFDr8n1xEf11g8IzWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-W47Jz7LPNlSpsFyBzxo2uw-1; Mon, 11 Nov 2019 04:58:45 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 030E8801E4E;
	Mon, 11 Nov 2019 09:58:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC5ED60143;
	Mon, 11 Nov 2019 09:58:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6D7304BB65;
	Mon, 11 Nov 2019 09:58:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA8InQrb027086 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 13:49:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 00FFB5D6D8; Fri,  8 Nov 2019 18:49:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5811E5D6AE;
	Fri,  8 Nov 2019 18:49:14 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E2B0E83F51;
	Fri,  8 Nov 2019 18:48:52 +0000 (UTC)
IronPort-SDR: h9LLTtQYtzPsgUxk0j5oTdJxze6cW31jFiv2uqsYxN+fE1wm9cKU16j4B1vqr+wlWVV22q8F3r
	a75+spcSd4eO5mUvbU5+0jgfyna0ITyu7H0OhpNPphcAxDWFLOYIM+b82+ki6pUDUvj+vUJaVE
	TXCEko+xhW8QZ05sc9tLuINPOK60HO5Kj8+zMKc7etBGbvQ09GhDkMjH02COoOVKsupfSST2h9
	OsDcYPVU2YPeMr+H/AKyM5b/HCylClseb1Rn8siEHx7PQZyoV5+NUZipdSqM8MZocWEAV5nT3i
	Gu8=
X-IronPort-AV: E=Sophos;i="5.68,282,1569254400"; d="scan'208";a="124136728"
Received: from mail-sn1nam01lp2055.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.55])
	by ob1.hgst.iphmx.com with ESMTP; 09 Nov 2019 02:48:44 +0800
Received: from DM6PR04MB5754.namprd04.prod.outlook.com (20.179.52.22) by
	DM6PR04MB3993.namprd04.prod.outlook.com (20.176.87.26) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Fri, 8 Nov 2019 18:48:43 +0000
Received: from DM6PR04MB5754.namprd04.prod.outlook.com
	([fe80::65c4:52fd:1454:4b04]) by
	DM6PR04MB5754.namprd04.prod.outlook.com
	([fe80::65c4:52fd:1454:4b04%7]) with mapi id 15.20.2430.020;
	Fri, 8 Nov 2019 18:48:43 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "Martin K .
	Petersen" <martin.petersen@oracle.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	"linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH 7/9] null_blk: Add zone_nr_conv to features
Thread-Index: AQHVldfeADQIZN8MvkW12chh05+aBg==
Date: Fri, 8 Nov 2019 18:48:43 +0000
Message-ID: <DM6PR04MB5754124089E14F2575C8412B867B0@DM6PR04MB5754.namprd04.prod.outlook.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
	<20191108015702.233102-8-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 69678c29-0853-48cb-72cd-08d7647c4750
x-ms-traffictypediagnostic: DM6PR04MB3993:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR04MB3993BABC096940C00E202208867B0@DM6PR04MB3993.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(189003)(199004)(71200400001)(55016002)(26005)(446003)(9686003)(102836004)(86362001)(53546011)(2906002)(3846002)(52536014)(66476007)(256004)(76116006)(5660300002)(64756008)(305945005)(91956017)(76176011)(6246003)(7736002)(99286004)(6506007)(6436002)(4744005)(2501003)(7696005)(6116002)(186003)(14454004)(110136005)(74316002)(478600001)(8936002)(66066001)(33656002)(66556008)(66946007)(66446008)(81156014)(486006)(8676002)(476003)(229853002)(316002)(81166006)(71190400001)(25786009)(921003)(1121003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB3993;
	H:DM6PR04MB5754.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KdZl+9ZAS3k06TQANsrW0In9tCnbakjnHijaznydDPPfmjVy/dSy1ciq6hGNZu1x67E1CPN2sWrQKB2trWx/dkrWnsPiwomw7YttiryNIXezyaGiq0RkAHvbkhnMAdOGv8EHZfUNppQGTEEG29y2Imia+5YnSy5H9dDG4yzSuzgnk+GxEfoAqWpK1zN56p4ceXRxJuq10DCa4Wzk3jGhpaKJvgxIs/hSmU7Pl1RdIFbBeF1GDs2Wffc1VH4JiIyM5bIlABAlCR+8x2iCv8j93VGl/JBgzhglhFNmVkEXVMCQat+KeHfzOSb1PumxerHFCqWjKIHIgB+2Kyxf5Ygh9h/AZASfMohUhY3t1WmjMJB1uFjeajkZXujD+aLc4PTVYwmaB3+eUicHslm9D5sqcDFC3vXh0XuF/UxtiHIQhqhcbcIVkCrYQTovF0SwMaUv
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69678c29-0853-48cb-72cd-08d7647c4750
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 18:48:43.0252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zxHr0NCf8vZJFcYIBdC6kL2UJxDIkbOSxFGjCHeMOY9OXUCPPAl0gOgk1hZvTb2xXlS67q0HzikANMNEu5gmXGaEfXQpYcbKhDSVNsgi8RA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB3993
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.27]); Fri, 08 Nov 2019 18:49:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Fri, 08 Nov 2019 18:49:06 +0000 (UTC) for IP:'216.71.154.45'
	DOMAIN:'esa6.hgst.iphmx.com' HELO:'esa6.hgst.iphmx.com'
	FROM:'Chaitanya.Kulkarni@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.45 esa6.hgst.iphmx.com
	216.71.154.45 esa6.hgst.iphmx.com
	<prvs=20831143c=Chaitanya.Kulkarni@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xA8InQrb027086
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 11 Nov 2019 04:58:01 -0500
Subject: Re: [dm-devel] [PATCH 7/9] null_blk: Add zone_nr_conv to features
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: W47Jz7LPNlSpsFyBzxo2uw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Looks good to me.

Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>

On 11/07/2019 05:57 PM, Damien Le Moal wrote:
> For a null_blk device with zoned mode enabled, the number of
> conventional zones can be configured through configfs with the
> zone_nr_conv parameter. Add this missing parameter in the features
> string.
>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

