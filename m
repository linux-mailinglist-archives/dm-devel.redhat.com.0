Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8D4F7145
	for <lists+dm-devel@lfdr.de>; Mon, 11 Nov 2019 10:58:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573466328;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=gvAX1AjAzk1Hs6uCNv5OiUNlA3ICuDK7R1o0+CQ5O0o=;
	b=LhipjVKxXckQFTuIWkcBRhINluIWnErhTXludYqbcxwdmOkTMx131steqM+NMPcFnRsh2G
	oGJIiY8u0sOfWxQ+h4rMGOO7iKm0UTU2fhOKH3YzXRZwndp8HimBYyRFrhNJILUS3FWXQl
	Xz4BRdb6mrHIBOgp+NtwPwYPDvmEePg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-GZBKnXS_PaKJyJgl8zAjMA-1; Mon, 11 Nov 2019 04:58:44 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0922B1005511;
	Mon, 11 Nov 2019 09:58:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D128A5EE0F;
	Mon, 11 Nov 2019 09:58:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4022318089C8;
	Mon, 11 Nov 2019 09:58:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA8Ioxic027160 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 13:50:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 232D55C578; Fri,  8 Nov 2019 18:50:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 842365C298;
	Fri,  8 Nov 2019 18:50:54 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 754A058C66;
	Fri,  8 Nov 2019 18:50:32 +0000 (UTC)
IronPort-SDR: OxAJnPtem5ArCNNmgAVdLDOppM+BK5Tb9NnJsuKeGM8R5R4Y3a0T7nCp6T54Md7PGlVNLpLk1t
	lcKJJRshIyytgz+REu0JZ3KU+HneXrpzBAiWc2xz/nLrT29p4Ym7r+W6uyNwiIQfX7bzm1TiIA
	NitoxPqaHsDdEoVA4/ITi+aaYiwrakwCDBc4fKLjAJU9quLVe8HT8ddxmikm3G+0g7yc1ZIOi9
	Rr3h4CVapQ46nbsCazkoO+ZQkXu4IP0uXXjK+M1Gdrsbo5I/xt/AcotqSbuHxsOLSF74BPhRqT
	E3E=
X-IronPort-AV: E=Sophos;i="5.68,282,1569254400"; d="scan'208";a="126961447"
Received: from mail-cys01nam02lp2056.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.56])
	by ob1.hgst.iphmx.com with ESMTP; 09 Nov 2019 02:50:24 +0800
Received: from DM6PR04MB5754.namprd04.prod.outlook.com (20.179.52.22) by
	DM6PR04MB4042.namprd04.prod.outlook.com (20.176.87.12) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2430.25; Fri, 8 Nov 2019 18:50:22 +0000
Received: from DM6PR04MB5754.namprd04.prod.outlook.com
	([fe80::65c4:52fd:1454:4b04]) by
	DM6PR04MB5754.namprd04.prod.outlook.com
	([fe80::65c4:52fd:1454:4b04%7]) with mapi id 15.20.2430.020;
	Fri, 8 Nov 2019 18:50:22 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "Martin K .
	Petersen" <martin.petersen@oracle.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	"linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH 2/9] block: cleanup the !zoned case in
	blk_revalidate_disk_zones
Thread-Index: AQHVldfc9s3RcjAaAUWO67LxGbcSfg==
Date: Fri, 8 Nov 2019 18:50:22 +0000
Message-ID: <DM6PR04MB5754E84538F2E0AC9C3FD797867B0@DM6PR04MB5754.namprd04.prod.outlook.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
	<20191108015702.233102-3-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 335b990a-eac9-4400-7934-08d7647c8272
x-ms-traffictypediagnostic: DM6PR04MB4042:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR04MB4042D948C540A667C897611B867B0@DM6PR04MB4042.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(189003)(199004)(81156014)(229853002)(99286004)(14454004)(66946007)(6246003)(86362001)(102836004)(4744005)(8936002)(305945005)(14444005)(486006)(76176011)(5660300002)(66446008)(7736002)(446003)(74316002)(81166006)(478600001)(66476007)(66556008)(64756008)(33656002)(9686003)(55016002)(186003)(52536014)(6436002)(476003)(110136005)(26005)(91956017)(2501003)(25786009)(316002)(256004)(7696005)(71200400001)(3846002)(6116002)(53546011)(6506007)(71190400001)(66066001)(76116006)(2906002)(8676002)(921003)(1121003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB4042;
	H:DM6PR04MB5754.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1VefVcdWrIleAOQ3p2ujBxXhf7nDGY/mWMgl1miqXRiNkPRH/3yNKUPdqBrZFONYt2zIPOgHuCsVfE5pxxb2sVFF5Ewp+7y8iwrHpzK0PBYNJYgQDhIZ0FXBPkehb4cH6bilx+s1CW71yZaHnralPe0ae492BqAzF2Y4AN49KZfLoxihP/+wru6mDrQMu1fcNpw5irXx0ipAn9QY2EXq5I4KtuBJoz0bo2Jls57xHv+EC6JdIf41VZDDycWPN0DhpeyDDC25jwpiaLdIzAqji3Akh7s1UaQzz+Wn0Y2iliNxSrtkR3bjF7JZ6cR5zY3MZlKLBMeVzYbkWfeX9WKyUGh8IvzL2yVz5jp9EQnY2D3EkULohxfqgpWmx8zGA8MMZNUbmgTxI/hifHw25Oba4iFGkLEdjkRiRtkYdpMKWmo4zvZgW/1vgReWpGBFmjY6
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 335b990a-eac9-4400-7934-08d7647c8272
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 18:50:22.1658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +/mqLsfKPN3fR+TDy77ZwhjMImDOwK/kri/RvC4q0GO80xZhwyDiqmL1NWs7qnBqBzYH6yUBd8F/q1coVcm/pTrSxdRZINhHJecRK7nqAHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4042
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.71]); Fri, 08 Nov 2019 18:50:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Fri, 08 Nov 2019 18:50:45 +0000 (UTC) for IP:'216.71.153.141'
	DOMAIN:'esa3.hgst.iphmx.com' HELO:'esa3.hgst.iphmx.com'
	FROM:'Chaitanya.Kulkarni@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.141 esa3.hgst.iphmx.com
	216.71.153.141 esa3.hgst.iphmx.com
	<prvs=20831143c=Chaitanya.Kulkarni@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xA8Ioxic027160
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 11 Nov 2019 04:58:01 -0500
Subject: Re: [dm-devel] [PATCH 2/9] block: cleanup the !zoned case in
 blk_revalidate_disk_zones
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: GZBKnXS_PaKJyJgl8zAjMA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Looks good to me.

Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>

On 11/07/2019 05:57 PM, Damien Le Moal wrote:
> From: Christoph Hellwig<hch@lst.de>
>
> blk_revalidate_disk_zones is never called for non-zoned devices.  Just
> return early and warn instead of trying to handle this case.
>
> Signed-off-by: Christoph Hellwig<hch@lst.de>
> Signed-off-by: Damien Le Moal<damien.lemoal@wdc.com>
> ---


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

