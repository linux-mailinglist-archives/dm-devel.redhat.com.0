Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDC522AA15
	for <lists+dm-devel@lfdr.de>; Thu, 23 Jul 2020 09:53:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-HjpeVrzaM7qMHIDQ0tamKA-1; Thu, 23 Jul 2020 03:53:48 -0400
X-MC-Unique: HjpeVrzaM7qMHIDQ0tamKA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E3651923773;
	Thu, 23 Jul 2020 07:53:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 625E81C4;
	Thu, 23 Jul 2020 07:53:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 338091809561;
	Thu, 23 Jul 2020 07:53:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06MBO5Y6012653 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 07:24:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C8387F7FDF; Wed, 22 Jul 2020 11:24:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C455BF8963
	for <dm-devel@redhat.com>; Wed, 22 Jul 2020 11:24:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 913861012444
	for <dm-devel@redhat.com>; Wed, 22 Jul 2020 11:24:03 +0000 (UTC)
Received: from lithops.sigma-star.at (lithops.sigma-star.at
	[195.201.40.130]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-77-Fi-JyqBPNSmH8bSDwZNCcg-1; Wed, 22 Jul 2020 07:24:01 -0400
X-MC-Unique: Fi-JyqBPNSmH8bSDwZNCcg-1
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 319D462D8C69;
	Wed, 22 Jul 2020 13:15:44 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id Zc9TNu-wkYTl; Wed, 22 Jul 2020 13:15:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9006B62D8C68;
	Wed, 22 Jul 2020 13:15:43 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id Ze2yEkGTJ1nH; Wed, 22 Jul 2020 13:15:43 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5BAE56071A74;
	Wed, 22 Jul 2020 13:15:43 +0200 (CEST)
Date: Wed, 22 Jul 2020 13:15:43 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: hch <hch@lst.de>
Message-ID: <1212963412.160863.1595416543195.JavaMail.zimbra@nod.at>
In-Reply-To: <20200722062552.212200-5-hch@lst.de>
References: <20200722062552.212200-1-hch@lst.de>
	<20200722062552.212200-5-hch@lst.de>
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
Thread-Topic: initialize ->ra_pages in bdi_init
Thread-Index: SEPLczWq50DYtFrGpPhckNZ8Awj6bw==
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06MBO5Y6012653
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 23 Jul 2020 03:53:01 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-block@vger.kernel.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, linux-mtd <linux-mtd@lists.infradead.org>,
	cgroups@vger.kernel.org, drbd-dev@tron.linbit.com,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-mm <linux-mm@kvack.org>
Subject: Re: [dm-devel] [PATCH 04/14] bdi: initialize ->ra_pages in bdi_init
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFNldCB1cCBhIHJlYWRhaGVhZCBzaXpl
IGJ5IGRlZmF1bHQsIGFzIHZlcnkgZmV3IHVzZXJzIGhhdmUgYSBnb29kCj4gcmVhc29uIHRvIGNo
YW5nZSBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4KPiAtLS0KPiBibG9jay9ibGstY29yZS5jICAgICAgfCAxIC0KPiBkcml2ZXJzL210ZC9tdGRj
b3JlLmMgfCAxICsKPiBmcy85cC92ZnNfc3VwZXIuYyAgICAgfCA0ICsrLS0KPiBmcy9hZnMvc3Vw
ZXIuYyAgICAgICAgfCAxIC0KPiBmcy9idHJmcy9kaXNrLWlvLmMgICAgfCAxIC0KPiBmcy9mdXNl
L2lub2RlLmMgICAgICAgfCAxIC0KPiBmcy9uZnMvc3VwZXIuYyAgICAgICAgfCA5ICstLS0tLS0t
LQo+IGZzL3ViaWZzL3N1cGVyLmMgICAgICB8IDEgKwoKRm9yIHViaWZzIGFuZCBtdGQ6CgpBY2tl
ZC1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KClRoYW5rcywKLy9yaWNo
YXJkCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6
Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

