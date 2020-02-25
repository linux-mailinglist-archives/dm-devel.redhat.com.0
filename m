Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id CC2A616EF73
	for <lists+dm-devel@lfdr.de>; Tue, 25 Feb 2020 20:54:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582660481;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:openpgp:openpgp;
	bh=unHXENfQyKLRyTS+y0Rve8OliGi7xUwcKa5FphAMvfw=;
	b=JIWzfTx27TE4yd6mcdJUYhcAVTorOpj7Tb5qUiS+dnspKpBV8/TWaNse7O4xBY8OdurCaZ
	HhfRHV4n/tKC+Lseo/GaHMYYHwbXxtIbS1656TZYfbR8fTQpDKcaDY4FPJ+tx1axqU3ODG
	RHChWuWIrJnypEGoFNjkwvQjwa1w5QE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-b1a4HWCCN9eyS-Ur9RmwFw-1; Tue, 25 Feb 2020 14:54:39 -0500
X-MC-Unique: b1a4HWCCN9eyS-Ur9RmwFw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74CD9107ACC4;
	Tue, 25 Feb 2020 19:54:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2747460BE2;
	Tue, 25 Feb 2020 19:54:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 12CCF8B2D8;
	Tue, 25 Feb 2020 19:54:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01PJsIJZ003459 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Feb 2020 14:54:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ED57820267F2; Tue, 25 Feb 2020 19:54:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8F702026FFE
	for <dm-devel@redhat.com>; Tue, 25 Feb 2020 19:54:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAF76185A79B
	for <dm-devel@redhat.com>; Tue, 25 Feb 2020 19:54:15 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [188.40.240.192]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-47-ykJBo2c3PAmtjl1dQXILpw-1;
	Tue, 25 Feb 2020 14:54:11 -0500
X-MC-Unique: ykJBo2c3PAmtjl1dQXILpw-1
Received: from mailer.emlix.com (unknown [81.20.119.6])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id E3F1D5F9B0;
	Tue, 25 Feb 2020 20:54:07 +0100 (CET)
To: Christoph Hellwig <hch@infradead.org>
References: <20200225170744.10485-1-dg@emlix.com>
	<20200225191222.GA3908@infradead.org>
From: =?UTF-8?Q?Daniel_Gl=c3=b6ckner?= <dg@emlix.com>
Openpgp: preference=signencrypt
Organization: emlix GmbH
Message-ID: <a932a297-266e-4dee-f030-40ecbc9899ca@emlix.com>
Date: Tue, 25 Feb 2020 20:54:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20200225191222.GA3908@infradead.org>
Content-Language: de-DE
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01PJsIJZ003459
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm integrity: reinitialize __bi_remaining
 when reusing bio
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gQ2hyaXN0b3BoLAoKQW0gMDIvMjUvMjAgdW0gMjA6MTIgc2NocmllYiBDaHJpc3RvcGgg
SGVsbHdpZzoKPiBPbiBUdWUsIEZlYiAyNSwgMjAyMCBhdCAwNjowNzo0NFBNICswMTAwLCBEYW5p
ZWwgR2zDtmNrbmVyIHdyb3RlOgo+PiBJbiBjYXNlcyB3aGVyZSBkZWNfaW5fZmxpZ2h0IGhhcyB0
byByZXF1ZXVlIHRoZSBpbnRlZ3JpdHlfYmlvX3dhaXQgd29yawo+PiB0byB0cmFuc2ZlciB0aGUg
cmVzdCBvZiB0aGUgZGF0YSwgdGhlIF9fYmlfcmVtYWluaW5nIGZpZWxkIG9mIHRoZSBiaW8KPj4g
bWlnaHQgYWxyZWFkeSBoYXZlIGJlZW4gZGVjcmVtZW50ZWQgdG8gemVyby4gUmV1c2luZyB0aGUg
YmlvIHdpdGhvdXQKPj4gcmVpbml0aWFsaXppbmcgdGhhdCBjb3VudGVyIHRvIDEgY2FuIHRoZW4g
cmVzdWx0IGluIGludGVncml0eV9lbmRfaW8KPj4gYmVpbmcgY2FsbGVkIHRvbyBlYXJseSB3aGVu
IHRoZSBCSU9fQ0hBSU4gZmxhZyBpcyBzZXQsIGYuZXguIGR1ZSB0bwo+PiBibGtfcXVldWVfc3Bs
aXQuIEluIG91ciBjYXNlIHRoaXMgdHJpZ2dlcmVkIHRoZSBCVUcoKSBpbgo+PiBibGtfbXFfZW5k
X3JlcXVlc3Qgd2hlbiB0aGUgaGFyZHdhcmUgc2lnbmFsbGVkIGNvbXBsZXRpb24gb2YgdGhlIGJp
bwo+PiBhZnRlciBpbnRlZ3JpdHlfZW5kX2lvIGhhZCBtb2RpZmllZCBpdC4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogRGFuaWVsIEdsw7Zja25lciA8ZGdAZW1saXguY29tPgo+IAo+IERyaXZlcnMgaGF2
ZSBubyBidXNpbmVzcyBwb2tpbmcgaW50byB0aGVzZSBpbnRlcm5hbHMuICBJZiBhIGJpbyBpcwo+
IHJldXNlZCB0aGUgY2FsbGVyIG5lZWRzIHRvIHVzZSBiaW9fcmVzZXQgaW5zdGVhZC4KCmJpb19y
ZXNldCB3aWxsIHJlc2V0IHRvbyBtYW55IGZpZWxkcy4gQXMgeW91IGNhbiBzZWUgaW4gdGhlIGNv
bnRleHQgb2YKdGhlIGRpZmYsIGRtLWludGVncml0eSBleHBlY3RzIGYuZXguIHRoZSB2YWx1ZXMg
bW9kaWZpZWQgYnkgYmlvX2FkdmFuY2UKdG8gc3RheSBpbnRhY3QgYW5kIHRoZSB0cmFuc2ZlciBz
aG91bGQgb2YgY291cnNlIHVzZSB0aGUgc2FtZSBkaXNrIGFuZApvcGVyYXRpb24uCgpIb3cgYWJv
dXQgZG9pbmcgdGhlIGF0b21pY19zZXQgaW4gYmlvX3JlbWFpbmluZ19kb25lIChpbiBibG9jay9i
aW8uYykKd2hlcmUgdGhlIEJJT19DSEFJTiBmbGFnIGlzIGNsZWFyZWQgb25jZSBfX2JpX3JlbWFp
bmluZyBoaXRzIHplcm8/Ck9yIGlzIHJlcXVldWluZyBhIGJpbyB3aXRob3V0IGJpb19yZXNldCBy
ZWFsbHkgYSBuby1nbz8gSW4gdGhhdCBjYXNlIGEKb25lLWxpbmVyIHdvbid0IGRvLi4uCgpCZXN0
IHJlZ2FyZHMsCgogIERhbmllbAoKLS0gCkJlc3VjaGVuIFNpZSB1bnMgYXVmIGRlciBFbWJlZGRl
ZCBXb3JsZCAyMDIwIGluIE7DvHJuYmVyZyEKLT4gSGFsbGUgNCwgU3RhbmQgMzY4CgpEaXBsLi1N
YXRoLiBEYW5pZWwgR2zDtmNrbmVyLCBlbWxpeCBHbWJILCBodHRwOi8vd3d3LmVtbGl4LmNvbQpG
b24gKzQ5IDU1MSAzMDY2NC0wLCBGYXggKzQ5IDU1MSAzMDY2NC0xMSwKR290aGFlciBQbGF0eiAz
LCAzNzA4MyBHw7Z0dGluZ2VuLCBHZXJtYW55ClNpdHogZGVyIEdlc2VsbHNjaGFmdDogR8O2dHRp
bmdlbiwgQW10c2dlcmljaHQgR8O2dHRpbmdlbiBIUiBCIDMxNjAKR2VzY2jDpGZ0c2bDvGhydW5n
OiBIZWlrZSBKb3JkYW4sIERyLiBVd2UgS3JhY2tlClVzdC1JZE5yLjogREUgMjA1IDE5OCAwNTUK
CmVtbGl4IC0geW91ciBlbWJlZGRlZCBsaW51eCBwYXJ0bmVyCgoKLS0KZG0tZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2RtLWRldmVs

