Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id AFB7819BC93
	for <lists+dm-devel@lfdr.de>; Thu,  2 Apr 2020 09:20:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585812048;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HjAvRqGiXMatRdqeiibn4g4FVybvYeYc38bTkDcRWhM=;
	b=aROFc3km/95DzDjKKLWJPityKiZy4uFj0TUzf2khQpQy14ntdVPtazTB3tetZXbDowFGjU
	bqBL92zXdm2WFPkAvlgxxcPdWnNnDUg/6lv5UFDR1IWZUFjWi7sc5YUmxZe569TgK3qHq8
	c4Xg+0mhKCXS4Q5RP5N+4jrRYLdvbWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-0ZKHMrz-Omewo3-i-PCt8w-1; Thu, 02 Apr 2020 03:20:46 -0400
X-MC-Unique: 0ZKHMrz-Omewo3-i-PCt8w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BECB801E6C;
	Thu,  2 Apr 2020 07:20:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48703DA113;
	Thu,  2 Apr 2020 07:20:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3316F944CC;
	Thu,  2 Apr 2020 07:20:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UFi5Jo028585 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 11:44:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 30514C68FA; Mon, 30 Mar 2020 15:44:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B6FFD0168
	for <dm-devel@redhat.com>; Mon, 30 Mar 2020 15:44:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41B558001E4
	for <dm-devel@redhat.com>; Mon, 30 Mar 2020 15:44:03 +0000 (UTC)
Received: from esa3.sap.c3s2.iphmx.com (esa3.sap.c3s2.iphmx.com
	[68.232.159.191]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-163-Qpcz2-74O1Gxiqy47v9p1w-1; Mon, 30 Mar 2020 11:44:00 -0400
X-MC-Unique: Qpcz2-74O1Gxiqy47v9p1w-1
IronPort-SDR: eoGEuhOLQKvtRGdSZgHMw9qvadvEYggMWRzOdmRoTgURdxvixmyf6MZo01ocyCZv6BbuTV0Idy
	doZd9psvsk3AkHGVYqfzGppdJ29S7gRQcKOxYmTFTXnEwg7QCcE2j8nSJG7zu9G69XSuHFyliy
	Ob1QM4e2ufErpM9Hko4QJ4C59xVsscFPFwUYLjEkU0U6ABt5BnukHEr7OC1p1xFk2PrD2EQ9hT
	/pqYw4WUNGKOkFTQYD8mBmX82HJ2H+02BjZuY0z6cavrvSeDObrgv1Fbab/7bSzv0SHugJIYUI
	v6oB+Jqlh4MuRpeI/s1iL3ZS
X-Amp-Result: SKIPPED(no attachment in message)
Received: from smtpgw02.mail.net.sap (HELO smtpgw.sap-ag.de) ([155.56.66.97])
	by esa3.sap.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
	30 Mar 2020 17:42:56 +0200
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.174)
	by smtpgw02.sap-ag.de (155.56.66.97) with Microsoft SMTP Server (TLS)
	id 15.0.1395.4; Mon, 30 Mar 2020 17:42:54 +0200
Received: from AM0PR02MB3842.eurprd02.prod.outlook.com (52.134.80.145) by
	AM0PR02MB5555.eurprd02.prod.outlook.com (20.179.39.159) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2856.19; Mon, 30 Mar 2020 15:42:53 +0000
Received: from AM0PR02MB3842.eurprd02.prod.outlook.com
	([fe80::41a9:104d:1efe:6e2]) by AM0PR02MB3842.eurprd02.prod.outlook.com
	([fe80::41a9:104d:1efe:6e2%3]) with mapi id 15.20.2856.019;
	Mon, 30 Mar 2020 15:42:53 +0000
From: "Bruggeman, Otto (external - Partner)" <otto.bruggeman@sap.com>
To: "Bruggeman, Otto (external - Partner)" <otto.bruggeman@sap.com>, "Mikulas
	Patocka" <mpatocka@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	Mike Snitzer <msnitzer@redhat.com>
Thread-Topic: Optane nvdimm performance
Thread-Index: AQHWBghJaSj9hvr+Gk+/gQ/orgjnU6hhE9WwgAAzhyA=
Date: Mon, 30 Mar 2020 15:42:52 +0000
Message-ID: <AM0PR02MB38422D6FEBB0D5FB3D23167A9BCB0@AM0PR02MB3842.eurprd02.prod.outlook.com>
References: <alpine.LRH.2.02.2003291116490.9236@file01.intranet.prod.int.rdu2.redhat.com>
	<AM0PR02MB3842ACBE359003CFBF32B6C59BCB0@AM0PR02MB3842.eurprd02.prod.outlook.com>
In-Reply-To: <AM0PR02MB3842ACBE359003CFBF32B6C59BCB0@AM0PR02MB3842.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.16.224.10]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c8d3b87-7d93-4f26-1096-08d7d4c1027e
x-ms-traffictypediagnostic: AM0PR02MB5555:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB555520B5A0A306790DEBC23B9BCB0@AM0PR02MB5555.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0358535363
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:AM0PR02MB3842.eurprd02.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10009020)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(66946007)(186003)(316002)(2940100002)(71200400001)(7116003)(54906003)(3480700007)(966005)(55016002)(110136005)(8936002)(26005)(8676002)(81166006)(2906002)(81156014)(9686003)(86362001)(76116006)(5660300002)(4326008)(66476007)(7696005)(52536014)(33656002)(64756008)(478600001)(6506007)(66556008)(66446008)(53546011);
	DIR:OUT; SFP:1101;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E6jCVVk1EcgNV0kXv3iFrlBAPYNnutuXAP2bTH1sBdRyheO0ym1vBGoD71zNudp/LzlmLsMbV6xhIcLpfvpqg5lXzYkzjnXxwreJy6UVUbS8b0k4YK1ExERvBjtSlDLhLijxCHMsYcnlgIUqp5bbvTUHEI0GMTIOXLMJgGjE89o95f7vvmBp6bRub1LgM12/slq7zARSbamgjs1E+I8PhALeb77zN7dwcVTe+Qh4DnLfWnWa/meQvyAGYGrW+zf7ktwhPLPvnEEvQCD/vf8l7A0NNxKK4iOvqSUl+DqH9RI7HlEPX/aYugkl+vvtvCimzxeidrCvAjPu2x1RaCSXez7NmTraq62vRquAWwyn+GD3HByLTBcBF+9YwTu9S4GI6KW/aSl+8UAQWiEWAanC1fPzQy3xFs5zpjnPRnihngMhbr7RvSsNIKTtbTLMyweXDF7n+j8h5ovJbiC8bWFUKxj6wpDuwDkfLx7z28Vw/GGQ089l7bKwCa0BdB6wEMbzV6DTgLhZ4p5qdIozmqIBcA==
x-ms-exchange-antispam-messagedata: 2O8aVlgZBtMl7Y0q8jYX/OJbL2yUcRt0eMBRGxrY7yPf4G0zUS97HOetQ4xpPuTvp8kbxTO5Hch4NlZPXxF0gJgNThqqrXA43oFb1eEowRqXnsOjkPPTooNmiEv4zbEct2X7faIoLav9dncLPphhSQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8d3b87-7d93-4f26-1096-08d7d4c1027e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2020 15:42:52.4061 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8zkKUOuXpRtA7gS/b3T513qRV+cDqHGpN0tyBbxXCzTQyMhxGzPPXKx9yw8D7mvAFX/RBq5MyRVErVsZ1eItsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5555
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02UFi5Jo028585
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 02 Apr 2020 03:20:12 -0400
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>
Subject: Re: [dm-devel] Optane nvdimm performance
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

My apologies, I meant to forward this mail and managed to press the wrong button...

-----Original Message-----
From: Bruggeman, Otto (external - Partner) <otto.bruggeman@sap.com> 
Sent: Monday, March 30, 2020 2:38 PM
To: Mikulas Patocka <mpatocka@redhat.com>; Dan Williams <dan.j.williams@intel.com>; Vishal Verma <vishal.l.verma@intel.com>; Dave Jiang <dave.jiang@intel.com>; Ira Weiny <ira.weiny@intel.com>; Mike Snitzer <msnitzer@redhat.com>
Cc: linux-nvdimm@lists.01.org; dm-devel@redhat.com
Subject: [CAUTION] RE: Optane nvdimm performance

FYI Mal sehen was da an antworten kommen...

-----Original Message-----
From: Mikulas Patocka <mpatocka@redhat.com> 
Sent: Sunday, March 29, 2020 10:26 PM
To: Dan Williams <dan.j.williams@intel.com>; Vishal Verma <vishal.l.verma@intel.com>; Dave Jiang <dave.jiang@intel.com>; Ira Weiny <ira.weiny@intel.com>; Mike Snitzer <msnitzer@redhat.com>
Cc: linux-nvdimm@lists.01.org; dm-devel@redhat.com
Subject: Optane nvdimm performance

Hi

I performed some microbenchmarks on a system with real Optane-based nvdimm 
and I found out that the fastest method how to write to persistent memory 
is to fill a cacheline with 8 8-byte writes and then issue clwb or 
clflushopt on the cacheline. With this method, we can achieve 1.6 GB/s 
throughput for linear writes. On the other hand, non-temporal writes 
achieve only 1.3 GB/s.

The results are here:
http://people.redhat.com/~mpatocka/testcases/pmem/microbenchmarks/pmem.txt

The benchmarks here:
http://people.redhat.com/~mpatocka/testcases/pmem/microbenchmarks/

The winning benchmark is this:
http://people.redhat.com/~mpatocka/testcases/pmem/microbenchmarks/thrp-write-8-clwb.c


However, the kernel is not using this fastest method, it is using 
non-temporal stores instead.


I took the novafs filesystem (see git clone 
https://github.com/NVSL/linux-nova), it uses 
__copy_from_user_inatomic_nocache, which calls __copy_user_nocache which 
performs non-temporal stores. I hacked __copy_user_nocache to use clwb 
instead of non-temporal stores and it improved filesystem performance 
significantly.

This is the patch
http://people.redhat.com/~mpatocka/testcases/pmem/benchmarks/copy-nocache.patch 
(for the kernel 5.1 because novafs needs this version) and these are 
benchmark results:
http://people.redhat.com/~mpatocka/testcases/pmem/benchmarks/fs-bench.txt

- you can see that "test2" has twice the write throughput of "test1"


I took the dm-writecache driver, it uses memcpy_flushcache to write data 
to persistent memory. I hacked memcpy_flushcache to use clwb instead of 
non-temporal stores.

The result is - for 512-byte writes, non-temporal stores perform better 
than cache flushing. For 1024-byte and larger writes, cache flushing 
performs better than non-temporal stores. (I also tried to use cached 
writes + clwb for dm-writecache metadata updates, but it had bad 
performance)


Do you have some explanation why nontemporal stores are better for 
512-byte copies and worse for 1024-byte copies? (like filling up some 
buffers inside the CPU)?

In the next email, I'm sending a patch that makes memcpy_flushcache use 
clflushopt for transfers larger than 768 bytes.


Mikulas
_______________________________________________
Linux-nvdimm mailing list -- linux-nvdimm@lists.01.org
To unsubscribe send an email to linux-nvdimm-leave@lists.01.org
_______________________________________________
Linux-nvdimm mailing list -- linux-nvdimm@lists.01.org
To unsubscribe send an email to linux-nvdimm-leave@lists.01.org


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

