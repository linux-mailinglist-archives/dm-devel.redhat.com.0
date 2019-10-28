Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 48355E6D98
	for <lists+dm-devel@lfdr.de>; Mon, 28 Oct 2019 08:56:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572249383;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=KzCr5FVsqopylxynzIXfKezJeEOGUA72/FX0ZrykLWM=;
	b=DwdplxoE0HBTcsQn8U2zBxI8GBkcwxaVy60ATfIF07itBnmcHFOaNFvB3iq0BW4tA7Q7JX
	6JjWp48tivf7nYiROvVw7kKNsYRa5ACUb2T6GzdkVyXx+Z6xWocXWgD0k8xvM713M04YNP
	ALNIc3L0JpTg2l+Ky4ibpSYyi7wRDg8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-VbAZWJ3ONQab14sAlXxppg-1; Mon, 28 Oct 2019 03:56:20 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CDB2476;
	Mon, 28 Oct 2019 07:56:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B5505D6A0;
	Mon, 28 Oct 2019 07:56:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB9E04A486;
	Mon, 28 Oct 2019 07:55:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9S7tb8R004418 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 28 Oct 2019 03:55:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3DA2C5D71A; Mon, 28 Oct 2019 07:55:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A565F5D6A9;
	Mon, 28 Oct 2019 07:55:32 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 69C7D90C7A;
	Mon, 28 Oct 2019 07:55:08 +0000 (UTC)
IronPort-SDR: IOotOmiiiKzZcfhrmAvlZKu+10WzLfJErl9quaY8zqLkJTwIrvzjJhMBj3q96DCNynzISuMPre
	lo1sZ8ZucXb6IYFHFa+yhkoU0lV/7raucJdtARGEnJc/mseqlA9KZabNQuwsEDGWle0I1xlO1Z
	hPvhVl7PAVUUqubpT7JnZUFkWSK77fAr8KsVsEisGjw26f6XZV8GGz9xBOc/1Swk2+dZxSTjTH
	l/rrKm6SabGSpFUrZ3kuT9xyEZ++ftbsLK760Dikl1d9d337G/F5KDsJwgd6SLpIDGfnbSZyTE
	JkA=
X-IronPort-AV: E=Sophos;i="5.68,239,1569254400"; d="scan'208";a="125883062"
Received: from mail-sn1nam01lp2052.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.52])
	by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2019 15:55:00 +0800
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
	BYAPR04MB5671.namprd04.prod.outlook.com (20.179.58.26) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2387.24; Mon, 28 Oct 2019 07:54:58 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::4176:5eda:76a2:3c40]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::4176:5eda:76a2:3c40%7]) with mapi id 15.20.2387.025;
	Mon, 28 Oct 2019 07:54:58 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, Jens Axboe
	<axboe@kernel.dk>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"Martin K . Petersen" <martin.petersen@oracle.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 2/8] block: Simplify REQ_OP_ZONE_RESET_ALL handling
Thread-Index: AQHVjM+qyQ9jYQA2rkqW8qZgt9NDUw==
Date: Mon, 28 Oct 2019 07:54:58 +0000
Message-ID: <BYAPR04MB58160668CEB54919B22AC2FBE7660@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20191027140549.26272-1-damien.lemoal@wdc.com>
	<20191027140549.26272-3-damien.lemoal@wdc.com>
	<BYAPR04MB5749C25A8558C0ED9AB3EA6786660@BYAPR04MB5749.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [91.217.168.176]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c61a2b99-f81b-481a-5094-08d75b7c20fb
x-ms-traffictypediagnostic: BYAPR04MB5671:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB5671B45DD221A8B9D3184CFAE7660@BYAPR04MB5671.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0204F0BDE2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(376002)(366004)(346002)(39860400002)(136003)(199004)(189003)(14444005)(256004)(25786009)(33656002)(8676002)(7696005)(86362001)(476003)(229853002)(2906002)(6436002)(486006)(66066001)(66946007)(305945005)(102836004)(71200400001)(186003)(81156014)(81166006)(71190400001)(7736002)(76176011)(2501003)(6506007)(74316002)(99286004)(53546011)(8936002)(110136005)(446003)(316002)(66556008)(64756008)(66446008)(66476007)(5660300002)(26005)(478600001)(55016002)(54906003)(4744005)(91956017)(76116006)(9686003)(3846002)(6116002)(4326008)(52536014)(6246003)(14454004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5671;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 63uhsBDpCP9gDxYvCjYXc9+Cnm0OejHqk74TlkVAGAmdWzd3iL0toD2mJmkwwUXiYB4LD0n/1GsTBhB9qI22FpE5C6paHt+HMw/kTo/UtqhQan0R8hQm3FaC1FzKzlogXJAYsfpfeGngqs1PY9tBmu5D0NwiweXejiwTW1xTpbLjraL9ugqFaTyiatFSC9xo+1MnkcynLu2EGysVHX3A7IQcFRe0ngpgIPvJyMMk8QFpoE6m2r1wzc5nfnt71e1ZjJlrpBexsgHVBn1/GnOmNYf4PKl/Pbz8VS5ISgkGP5T5q3j1ACtov811aUyYGBxY9+UnPLtAoP1WRKEXkpxCFGS90s9O0Potmbs6X065B0WYJtEfGhSbr9PybKkQOxVHDwZnEp3QtKdhFcn/NbQdtxvI6YrN0Jqg42yXQL548dV1Yv0mqhb3jDkJmXLB2/Po
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c61a2b99-f81b-481a-5094-08d75b7c20fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2019 07:54:58.1758 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CIRfo35TkisZoU4QjW36MYARXL+7l933TB/Ai/TP3+LqwHLe15IH3IUigRizIUV7zJJlfAR3UvYMoFbAX1DOmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5671
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Mon, 28 Oct 2019 07:55:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Mon, 28 Oct 2019 07:55:21 +0000 (UTC) for IP:'216.71.153.141'
	DOMAIN:'esa3.hgst.iphmx.com' HELO:'esa3.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.141 esa3.hgst.iphmx.com
	216.71.153.141 esa3.hgst.iphmx.com
	<prvs=19766d7de=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9S7tb8R004418
X-loop: dm-devel@redhat.com
Cc: Ajay Joshi <Ajay.Joshi@wdc.com>, Fomichev <Dmitry.Fomichev@wdc.com>,
	Hans Holmberg <Hans.Holmberg@wdc.com>,
	Keith Busch <kbusch@kernel.org>, Dmitry,
	Matias Bjorling <Matias.Bjorling@wdc.com>
Subject: Re: [dm-devel] [PATCH 2/8] block: Simplify REQ_OP_ZONE_RESET_ALL
	handling
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
X-MC-Unique: VbAZWJ3ONQab14sAlXxppg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2019/10/28 8:49, Chaitanya Kulkarni wrote:
> The reason code for REQ_OP_RESET_ALL is kept in a different function so
> we can clearly differentiate between REQ_OP_RESET and REQ_OP_RESET_ALL
> when we add new tracepoints with blktrace framework.

Isn't the trace point under submit_bio() in
generic_make_request_checks() ? So removing the function is not a
problem for tracing as far as I can tell. Am I missing something ?

> 
> But if that is acceptable, then,
> 
> Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
> 
> On 10/27/19 7:06 AM, Damien Le Moal wrote:
>> There is no need for the function __blkdev_reset_all_zones() as
>> REQ_OP_ZONE_RESET_ALL can be handled directly in blkdev_reset_zones()
>> bio loop with an early break from the loop. This patch removes this
>> function and modifies blkdev_reset_zones(), simplifying the code.
>>
>> Signed-off-by: Damien Le Moal<damien.lemoal@wdc.com>
> 
> 


-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

