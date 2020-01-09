Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 186311354F1
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jan 2020 09:58:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578560282;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NTqB0gORPQRkQfQrvXGDlETlF+yJcZYUtGVeDaSK87Y=;
	b=c/Wth510eOQzoM83rfwZ5Y2gwnOaevkd44LN9LbZyZnSVUZLj50zBCcJvMMCaZwAIOT/b6
	SGG9eaTXE2iuAGPDi6nGHrQIrlM8IaKOHTQit/jD+pyMz59sbyE353DPVjZGlNjOWYLVBt
	ehBxvk3iyklDOv79hW2MEp/C4wN2FSk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-V73bAxdPPr6BFEZBqCLbVA-1; Thu, 09 Jan 2020 03:57:47 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B97781005512;
	Thu,  9 Jan 2020 08:57:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FE7560C88;
	Thu,  9 Jan 2020 08:57:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 269D0503BA;
	Thu,  9 Jan 2020 08:57:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0090q1Yd015800 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jan 2020 19:52:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CE1AF2022EAD; Thu,  9 Jan 2020 00:52:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C85722022EAB
	for <dm-devel@redhat.com>; Thu,  9 Jan 2020 00:51:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F021802096
	for <dm-devel@redhat.com>; Thu,  9 Jan 2020 00:51:59 +0000 (UTC)
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-373-8c5sfqjLMDKSE-Nz7Q1RcA-1; Wed, 08 Jan 2020 19:51:55 -0500
Received: from s0106ac1f6bb1ecac.cg.shawcable.net ([70.73.163.230]
	helo=[192.168.11.155]) by ale.deltatee.com with esmtpsa
	(TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
	(envelope-from <logang@deltatee.com>)
	id 1ipM2z-0004er-Vz; Wed, 08 Jan 2020 17:51:38 -0700
To: =?UTF-8?Q?Javier_Gonz=c3=a1lez?= <javier@javigon.com>,
	Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
References: <BYAPR04MB5749820C322B40C7DBBBCA02863F0@BYAPR04MB5749.namprd04.prod.outlook.com>
	<20200108101759.32gkjxakxigolail@mpHalley.local>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <7b3cc17c-6a34-56b9-8353-f86a4015669d@deltatee.com>
Date: Wed, 8 Jan 2020 17:51:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200108101759.32gkjxakxigolail@mpHalley.local>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 70.73.163.230
X-SA-Exim-Rcpt-To: stephen@eideticom.com, joshi.k@samsung.com,
	Matias.Bjorling@wdc.com, frederick.knight@netapp.com,
	rwheeler@redhat.com, roland@purestorage.com, zach.brown@ni.com,
	mpatocka@redhat.com, msnitzer@redhat.com, sbates@raithlin.com,
	hch@lst.de, kbusch@kernel.org, martin.petersen@oracle.com,
	hare@suse.de, bvanassche@acm.org, axboe@kernel.dk,
	lsf-pc@lists.linux-foundation.org, dm-devel@redhat.com,
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
	linux-block@vger.kernel.org, Chaitanya.Kulkarni@wdc.com,
	javier@javigon.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	GREYLIST_ISWHITE autolearn=ham autolearn_force=no version=3.4.2
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-MC-Unique: 8c5sfqjLMDKSE-Nz7Q1RcA-1
X-MC-Unique: V73bAxdPPr6BFEZBqCLbVA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0090q1Yd015800
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 09 Jan 2020 03:55:26 -0500
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
	"roland@purestorage.com" <roland@purestorage.com>,
	"msnitzer@redhat.com" <msnitzer@redhat.com>,
	"stephen@eideticom.com" <stephen@eideticom.com>,
	"bvanassche@acm.org" <bvanassche@acm.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	Matias Bjorling <Matias.Bjorling@wdc.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Stephen Bates <sbates@raithlin.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mpatocka@redhat.com" <mpatocka@redhat.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Keith Busch <kbusch@kernel.org>,
	"lsf-pc@lists.linux-foundation.org" <lsf-pc@lists.linux-foundation.org>,
	"rwheeler@redhat.com" <rwheeler@redhat.com>,
	Christoph Hellwig <hch@lst.de>,
	"frederick.knight@netapp.com" <frederick.knight@netapp.com>,
	"zach.brown@ni.com" <zach.brown@ni.com>
Subject: Re: [dm-devel] [LSF/MM/BFP ATTEND] [LSF/MM/BFP TOPIC] Storage: Copy
	Offload
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

CgpPbiAyMDIwLTAxLTA4IDM6MTcgYS5tLiwgSmF2aWVyIEdvbnrDoWxleiB3cm90ZToKPiBJIHRo
aW5rIHRoaXMgaXMgZ29vZCB0b3BpYyBhbmQgSSB3b3VsZCBsaWtlIHRvIHBhcnRpY2lwYXRlIGlu
IHRoZQo+IGRpc2N1c3Npb24gdG9vLiBJIHRoaW5rIHRoYXQgTG9nYW4gR3VudGhvcnBlIHdvdWxk
IGFsc28gYmUgaW50ZXJlc3RlZAo+IChDYykuIEFkZGluZyBLYW5jaGFuIHRvbywgd2hvIGlzIGFs
c28gd29ya2luZyBvbiB0aGlzIGFuZCBjYW4gY29udHJpYnV0ZQo+IHRvIHRoZSBkaXNjdXNzaW9u
Cj4gCj4gV2UgZGlzY3Vzc2VkIHRoaXMgaW4gdGhlIGNvbnRleHQgb2YgUDJQIGF0IGRpZmZlcmVu
dCBTTklBIGV2ZW50cyBpbiB0aGUKPiBjb250ZXh0IG9mIGNvbXB1dGF0aW9uYWwgb2ZmbG9hZHMg
YW5kIGFsc28gYXMgdGhlIGJhY2tlbmQgaW1wbGVtZW50YXRpb24KPiBmb3IgU2ltcGxlIENvcHks
IHdoaWNoIGlzIGNvbWluZyBpbiBOVk1lLiBEaXNjdXNzaW5nIHRoaXMgKGFnYWluKSBhdAo+IExT
Ri9NTSBhbmQgZmluZGluZyBhIHdheSB0byBmaW5hbGx5IGdldCBYQ09QWSBtZXJnZWQgd291bGQg
YmUgZ3JlYXQuCgpZZXMsIEkgd291bGQgZGVmaW5pdGVseSBiZSBpbnRlcmVzdGVkIGluIGRpc2N1
c3NpbmcgY29weSBvZmZsb2FkCmVzcGVjaWFsbHkgaW4gdGhlIGNvbnRleHQgb2YgUDJQLiBTb3J0
aW5nIG91dCBhIHVzZXJzcGFjZSBpbnRlcmZhY2UgZm9yCnRoaXMgdGhhdCBzdXBwb3J0cyBhIFAy
UCB1c2UgY2FzZSB3b3VsZCBiZSB2ZXJ5IGJlbmVmaWNpYWwgdG8gYSBsb3Qgb2YKZm9sa3MuCgpU
aGFua3MsCgpMb2dhbgoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQu
Y29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

