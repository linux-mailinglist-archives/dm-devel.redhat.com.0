Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCF524EC5B
	for <lists+dm-devel@lfdr.de>; Sun, 23 Aug 2020 11:10:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-vU_NIK8GNLyMVuZWbFFiXg-1; Sun, 23 Aug 2020 05:10:21 -0400
X-MC-Unique: vU_NIK8GNLyMVuZWbFFiXg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2561F1DDE4;
	Sun, 23 Aug 2020 09:10:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 689A560F96;
	Sun, 23 Aug 2020 09:10:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 60460180B655;
	Sun, 23 Aug 2020 09:09:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07N99OSj021308 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 23 Aug 2020 05:09:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1248EA9FA0; Sun, 23 Aug 2020 09:09:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E3E8A9F5B
	for <dm-devel@redhat.com>; Sun, 23 Aug 2020 09:09:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DE86186E120
	for <dm-devel@redhat.com>; Sun, 23 Aug 2020 09:09:21 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-363-mWZxpNhwN22rwosQ0dHOkw-1;
	Sun, 23 Aug 2020 05:09:19 -0400
X-MC-Unique: mWZxpNhwN22rwosQ0dHOkw-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9836468AFE; Sun, 23 Aug 2020 11:09:15 +0200 (CEST)
Date: Sun, 23 Aug 2020 11:09:15 +0200
From: Christoph Hellwig <hch@lst.de>
To: =?utf-8?B?55Sw?= <xianting_tian@126.com>
Message-ID: <20200823090915.GA2764@lst.de>
References: <20200821085600.2395666-1-hch@lst.de>
	<20200821085600.2395666-3-hch@lst.de>
	<4df016bc-570c-d166-47dd-36a9f21fad13@suse.de>
	<133efc8b.1649.17410784734.Coremail.xianting_tian@126.com>
MIME-Version: 1.0
In-Reply-To: <133efc8b.1649.17410784734.Coremail.xianting_tian@126.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07N99OSj021308
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	Jan Hoeppner <hoeppner@linux.ibm.com>, Justin Sanders <justin@coraid.com>,
	Josef Bacik <josef@toxicpanda.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"nbd@other.debian.org" <nbd@other.debian.org>,
	Christoph Hellwig <hch@lst.de>, Stefan Haberland <sth@linux.ibm.com>
Subject: Re: [dm-devel] [PATCH 2/2] block: fix locking for struct
 block_device size updates
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gRnJpLCBBdWcgMjEsIDIwMjAgYXQgMDY6MDI6MzJQTSArMDgwMCwg55SwIHdyb3RlOgo+IHRo
YW5rcyBIZWxsd2lnIGZvciB5b3VyIGtpbmRseSByZXBseSBhbmQgeW91ciBmaXggYW5kIGFkZCBy
ZXBvcnQgYnkgbWUgOikKCkkgZm91bmQgYW4gaXNzdWUgd2l0aCB0aGUgcGF0Y2gsIGFuZCB3aWxs
IHNlbmQgYSBuZXcgdmVyc2lvbiBpbiBhIGJpdC4KSWYgdGhpcyB3b3JrcyBmb3IgeW91ciByZXBy
b2R1Y2VyLCBjYW4geW91IGFkZCBhIFRlc3RlZC1ieTogdGFnPwoKCi0tCmRtLWRldmVsIG1haWxp
bmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1h
bi9saXN0aW5mby9kbS1kZXZlbA==

