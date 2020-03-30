Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA3219BC94
	for <lists+dm-devel@lfdr.de>; Thu,  2 Apr 2020 09:20:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585812049;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=u8GTs+mltNypUY9tjVZJUdD2x3mOveefg/RxYeAFpZQ=;
	b=HYwdMp7joCJSKevUS3iTLgOPLHPSzNOA8m7lcFm+86EXdTA03s93J3kFVxkX9abDHWDhaN
	plHoFVufMjgjOCx0nI397CMeuoK/CyKb/C4Mhf2toeOLXZ6EbmGxkkWj3McYveDrLcV9US
	mq3ycTZSEzjvQH8yiABJojXTUZ5w/pc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-hG3HiYUvOdWBvl_78L5_zw-1; Thu, 02 Apr 2020 03:20:46 -0400
X-MC-Unique: hG3HiYUvOdWBvl_78L5_zw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA237800D6C;
	Thu,  2 Apr 2020 07:20:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC005DA10A;
	Thu,  2 Apr 2020 07:20:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 32FB718089CD;
	Thu,  2 Apr 2020 07:20:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UCd2bP017055 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 08:39:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 52B2B2166B30; Mon, 30 Mar 2020 12:39:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CE602166B33
	for <dm-devel@redhat.com>; Mon, 30 Mar 2020 12:38:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F2FA8FF671
	for <dm-devel@redhat.com>; Mon, 30 Mar 2020 12:38:59 +0000 (UTC)
Received: from esa15.sap.c3s2.iphmx.com (esa15.sap.c3s2.iphmx.com
	[216.71.156.113]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-123-PXyx8O13NkSz-_jAkDmRig-1; Mon, 30 Mar 2020 08:38:57 -0400
X-MC-Unique: PXyx8O13NkSz-_jAkDmRig-1
IronPort-SDR: m+S6lToFIgBZ4TyKTwvpqjjdoTaHfZbe2T1Wi7AMO88ho4PNyzCcU2Tvns4I76G3NV6sDuRn+c
	9s2Z8p55MEhdJzAeyPTINznbEnNEMMgQBcdNTOcO+ajxqTyamKNLkRVGIkmX3/7+sFaeOjmXO1
	wkCWidaDXu1wBiU8QgKwMSxUA3GqfAbJyCrB/cOoCA1pCS6N7r+PU6+Djcrr2kSKg2xoZvlE+y
	X2pcWCpo5+cvgR+I9Fyjh6nRsStnBxhxSc1zQMk1pFJ0lTz27KQDPRIbEa7mLLYM0YuMt3hlJH
	KQnOpV8989DObbpDrKbGsr/L
X-Amp-Result: SKIPPED(no attachment in message)
Received: from smtpgw04.mail.net.sap (HELO smtpgw.sap-ag.de) ([155.56.66.99])
	by esa15.sap.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
	30 Mar 2020 14:37:52 +0200
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.111)
	by smtpgw04.sap-ag.de (155.56.66.99) with Microsoft SMTP Server (TLS)
	id 15.0.1395.4; Mon, 30 Mar 2020 14:37:51 +0200
Received: from AM0PR02MB3842.eurprd02.prod.outlook.com (52.134.80.145) by
	AM0PR02MB3857.eurprd02.prod.outlook.com (52.134.85.144) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2856.20; Mon, 30 Mar 2020 12:37:50 +0000
Received: from AM0PR02MB3842.eurprd02.prod.outlook.com
	([fe80::41a9:104d:1efe:6e2]) by AM0PR02MB3842.eurprd02.prod.outlook.com
	([fe80::41a9:104d:1efe:6e2%3]) with mapi id 15.20.2856.019;
	Mon, 30 Mar 2020 12:37:49 +0000
From: "Bruggeman, Otto (external - Partner)" <otto.bruggeman@sap.com>
To: Mikulas Patocka <mpatocka@redhat.com>, Dan Williams
	<dan.j.williams@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, "Dave
	Jiang" <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	Mike Snitzer <msnitzer@redhat.com>
Thread-Topic: Optane nvdimm performance
Thread-Index: AQHWBghJaSj9hvr+Gk+/gQ/orgjnU6hhE9Ww
Date: Mon, 30 Mar 2020 12:37:48 +0000
Message-ID: <AM0PR02MB3842ACBE359003CFBF32B6C59BCB0@AM0PR02MB3842.eurprd02.prod.outlook.com>
References: <alpine.LRH.2.02.2003291116490.9236@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2003291116490.9236@file01.intranet.prod.int.rdu2.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.16.224.10]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9c6be91-3482-4ad8-ffc0-08d7d4a72825
x-ms-traffictypediagnostic: AM0PR02MB3857:
x-microsoft-antispam-prvs: <AM0PR02MB385709A4A3866763918AB85D9BCB0@AM0PR02MB3857.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0358535363
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:AM0PR02MB3842.eurprd02.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10009020)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(71200400001)(8676002)(6506007)(81166006)(966005)(7116003)(81156014)(7696005)(9686003)(86362001)(53546011)(4326008)(478600001)(5660300002)(52536014)(76116006)(66946007)(66446008)(64756008)(66556008)(66476007)(3480700007)(110136005)(55016002)(186003)(54906003)(33656002)(26005)(2906002)(8936002)(316002);
	DIR:OUT; SFP:1101;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DR72ItQJi8UD303jgSefcuWhZDSib5V879c2s441I95hzJWJWnFD+vf2QGd2yGWOmI+VeqM6U0OuDnKAn6KbdRvTP2ZS4jFIEijYULr7hPPpo2v01VTgK+VJ6ny8M6GN96/ZMLQZdZwUZ/7jNi8XzSR6GKCbxOEn4zWskkA/yav0pAkloN7jV+DvubiDesPrXHDaOfgBK5vUT4BrVsDN4t/ezkAHNgsPbetoWqZsVHfIismny8DFDeOEgBbOt2dqIJiGJ5ScKAbSRA+/xwlQcLiDJBhrynDgYK6u9k+MV2JyoCUrlkrUrUpOacR8eTF1y2SI5CZ/m7x/VDlI/QxGwh1DgfbBI6CVvDq6wjjb26TQiv2fatGpyk68XeB565pxYRgU41KZx7aaJC7O6TFYsMKxh/iiaEumrcLAiUGtf5YZqNrdQEpQCzZaULsKw2kk2OLS/qDSU4HGtOyxviM7xFaOPhml7YiJ2bXxNYxS6l6IQspQ6ANnmaPxxUddD83yXRVCQe8v85MqwtApr4v/2g==
x-ms-exchange-antispam-messagedata: sjhUiPecDBNbbbItQsxGbLDYCxfuCO6ik+pesY1b7XHSKQZMntAOgXUM46b3frogWuZc1XSNECfchcFgofUJkhy0rBHFY1J3efxL2GJVVcJyapkhwiNzFV/nKNNoWM0yQH79fTuYEjNuosIH/KZSow==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c6be91-3482-4ad8-ffc0-08d7d4a72825
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2020 12:37:49.3550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VpS8K+3rkro0+jJLrcLIvTe1YhD5eNZa8OdK8sDVbFX8KtXBQWXxQSdvI74y1tzPrp/zairaZNFVU7KvYl6jqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB3857
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02UCd2bP017055
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


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

