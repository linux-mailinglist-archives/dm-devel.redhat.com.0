Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2174619BC96
	for <lists+dm-devel@lfdr.de>; Thu,  2 Apr 2020 09:20:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585812051;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=snFe6Jc+9KnlcQ+xrdWwZ8FKNtolShXIatf7p8mPBX4=;
	b=YhjPes0GMqwv1NB8OdpqgQFAivXBDQ2GoxPiNVIkOtBgksrAOc2QMr+2m5j80NSeIph8EX
	qXbgWVH5EbyGHPT9oD5u482KHUwjV7ajEGw+fnxpaf63TG0ZMaoX6YqTZ/vXsogSmOfA5M
	vfRdGRU4P4G8mD1e4T9N2bohJdlyVmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-IDjMS1TiMWCqB2zZomhvUg-1; Thu, 02 Apr 2020 03:20:48 -0400
X-MC-Unique: IDjMS1TiMWCqB2zZomhvUg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B827107ACCA;
	Thu,  2 Apr 2020 07:20:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 042346EF97;
	Thu,  2 Apr 2020 07:20:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 82AA9944D2;
	Thu,  2 Apr 2020 07:20:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02V0SBeb026930 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 20:28:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9E41F2166B30; Tue, 31 Mar 2020 00:28:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99AF72166B32
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 00:28:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56C618007A4
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 00:28:09 +0000 (UTC)
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
	[148.163.147.86]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-339-QgYNH5YOOfu5rQq4dvOU8w-1; Mon, 30 Mar 2020 20:28:06 -0400
X-MC-Unique: QgYNH5YOOfu5rQq4dvOU8w-1
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	02V0NKkx012711; Tue, 31 Mar 2020 00:28:04 GMT
Received: from g9t5009.houston.hpe.com (g9t5009.houston.hpe.com [15.241.48.73])
	by mx0a-002e3701.pphosted.com with ESMTP id 303qjk9df1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 31 Mar 2020 00:28:04 +0000
Received: from G9W8456.americas.hpqcorp.net (exchangepmrr1.us.hpecorp.net
	[16.216.161.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by g9t5009.houston.hpe.com (Postfix) with ESMTPS id 899E270;
	Tue, 31 Mar 2020 00:28:03 +0000 (UTC)
Received: from G9W8454.americas.hpqcorp.net (2002:10d8:a104::10d8:a104) by
	G9W8456.americas.hpqcorp.net (2002:10d8:a15f::10d8:a15f) with Microsoft
	SMTP Server (TLS) id 15.0.1497.2; Tue, 31 Mar 2020 00:28:03 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (15.241.52.12) by
	G9W8454.americas.hpqcorp.net (16.216.161.4) with Microsoft SMTP
	Server (TLS)
	id 15.0.1497.2 via Frontend Transport; Tue, 31 Mar 2020 00:28:03 +0000
Received: from CS1PR8401MB1237.NAMPRD84.PROD.OUTLOOK.COM
	(2a01:111:e400:7514::15) by CS1PR8401MB0519.NAMPRD84.PROD.OUTLOOK.COM
	(2a01:111:e400:7509::23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20;
	Tue, 31 Mar 2020 00:28:01 +0000
Received: from CS1PR8401MB1237.NAMPRD84.PROD.OUTLOOK.COM
	([fe80::6023:914f:6cca:4c98]) by
	CS1PR8401MB1237.NAMPRD84.PROD.OUTLOOK.COM
	([fe80::6023:914f:6cca:4c98%7]) with mapi id 15.20.2856.019;
	Tue, 31 Mar 2020 00:28:01 +0000
From: "Elliott, Robert (Servers)" <elliott@hpe.com>
To: Mikulas Patocka <mpatocka@redhat.com>, Dan Williams
	<dan.j.williams@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, "Dave
	Jiang" <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	Mike Snitzer <msnitzer@redhat.com>
Thread-Topic: [PATCH v2] memcpy_flushcache: use cache flusing for larger
	lengths
Thread-Index: AQHWBob+0rIHl10OXEaKSzaWD6MWpKhh0ScQ
Date: Tue, 31 Mar 2020 00:28:01 +0000
Message-ID: <CS1PR8401MB12377197482867F688BF93F7ABC80@CS1PR8401MB1237.NAMPRD84.PROD.OUTLOOK.COM>
References: <alpine.LRH.2.02.2003291625590.32108@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2003300729320.9938@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2003300729320.9938@file01.intranet.prod.int.rdu2.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [73.206.28.217]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 487cec50-a767-46f6-87fd-08d7d50a5ee6
x-ms-traffictypediagnostic: CS1PR8401MB0519:
x-microsoft-antispam-prvs: <CS1PR8401MB0519F05506A9C9E69E24D4B6ABC80@CS1PR8401MB0519.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:473;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CS1PR8401MB1237.NAMPRD84.PROD.OUTLOOK.COM;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(136003)(346002)(376002)(396003)(39860400002)(366004)(55016002)(81166006)(8676002)(81156014)(53546011)(54906003)(316002)(110136005)(7696005)(6506007)(66946007)(71200400001)(66446008)(86362001)(8936002)(33656002)(9686003)(186003)(478600001)(26005)(76116006)(4326008)(2906002)(64756008)(66476007)(52536014)(5660300002)(66556008);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JTiLml9JUPekVlsBCXfsfTKyJvTNiV1dZsrkQ1Un/YlbvqvfipcZkX+LNrVVo8xVIp3b3/egS5ou5oA1oVs08NkpeDRQ/PaKsCQuIghIz0tq6pDCp0uHI0xR9+U5GEi+F5l4yY6wsryGkUC+j7KzNiNO7VYLaQCvwvbx8jHL/26De1gvP+RsH67OZaQDwr/l68EBQ2vcDDRT4CliIyP6TTJ7/Ay+1mzMXOEiGjkmfGoaXV1bYNb40szvwQ0pcUDXHxdx49eT9z0r5udsrcWo67+lSzrb4csDz6KtZedb+9jYBDqQsyqvmTeoJFpnhxnAYw4cajs4IJf2Tsu1saisq+c3sKvFgXPdiDaYAZeW2OqMsNkTj/S5tscethihpCdxUBC/eNaBMY0dC2VAJiGWH3oiYS+EzUV23GzR8XXRv/N13v6kApw6k8PdtYtXBc9O
x-ms-exchange-antispam-messagedata: YY8r65q0WyiPF93UJ3S4KRMPdfw+50yiJdr4o79W84aztSzvBEJNAefDIwnPkpark8tFhqZxqNaQSPTkpsB22ZyAlGC9s7whF6RFtMhZ1gGfK4UMJPciju7rFICfrgVhvQePDSEBcZvro0AV2iU2Rw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 487cec50-a767-46f6-87fd-08d7d50a5ee6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 00:28:01.3750 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iZ3oXsVHYr/mCTYfW567NqKUugVjIu6HmfzIQdRVGILcGow4hZXCtKY6BpHJRPef
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CS1PR8401MB0519
X-OriginatorOrg: hpe.com
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
	definitions=2020-03-30_07:2020-03-30,
	2020-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	mlxscore=0 phishscore=0
	mlxlogscore=999 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
	clxscore=1011 lowpriorityscore=0 suspectscore=0 malwarescore=0
	priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003310000
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02V0SBeb026930
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 02 Apr 2020 03:20:12 -0400
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>
Subject: Re: [dm-devel] [PATCH v2] memcpy_flushcache: use cache flusing for
 larger lengths
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Mikulas Patocka <mpatocka@redhat.com>
> Sent: Monday, March 30, 2020 6:32 AM
> To: Dan Williams <dan.j.williams@intel.com>; Vishal Verma
> <vishal.l.verma@intel.com>; Dave Jiang <dave.jiang@intel.com>; Ira
> Weiny <ira.weiny@intel.com>; Mike Snitzer <msnitzer@redhat.com>
> Cc: linux-nvdimm@lists.01.org; dm-devel@redhat.com
> Subject: [PATCH v2] memcpy_flushcache: use cache flusing for larger
> lengths
> 
> I tested dm-writecache performance on a machine with Optane nvdimm
> and it turned out that for larger writes, cached stores + cache
> flushing perform better than non-temporal stores. This is the
> throughput of dm- writecache measured with this command:
> dd if=/dev/zero of=/dev/mapper/wc bs=64 oflag=direct
> 
> block size	512		1024		2048		4096
> movnti	496 MB/s	642 MB/s	725 MB/s	744 MB/s
> clflushopt	373 MB/s	688 MB/s	1.1 GB/s	1.2 GB/s
> 
> We can see that for smaller block, movnti performs better, but for
> larger blocks, clflushopt has better performance.

There are other interactions to consider... see threads from the last
few years on the linux-nvdimm list.

For example, software generally expects that read()s take a long time and
avoids re-reading from disk; the normal pattern is to hold the data in
memory and read it from there. By using normal stores, CPU caches end up
holding a bunch of persistent memory data that is probably not going to
be read again any time soon, bumping out more useful data. In contrast,
movnti avoids filling the CPU caches.

Another option is the AVX vmovntdq instruction (if available), the
most recent of which does 64-byte (cache line) sized transfers to
zmm registers. There's a hefty context switching overhead (e.g.,
304 clocks), and the CPU often runs AVX instructions at a slower
clock frequency, so it's hard to judge when it's worthwhile.

In user space, glibc faces similar choices for its memcpy() functions;
glibc memcpy() uses non-temporal stores for transfers > 75% of the
L3 cache size divided by the number of cores. For example, with
glibc-2.216-16.fc27 (August 2017), on a Broadwell system with
E5-2699 36 cores 45 MiB L3 cache, non-temporal stores are used
for memcpy()s over 36 MiB.

It'd be nice if glibc, PMDK, and the kernel used the same algorithms.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

