Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EA7071099BD
	for <lists+dm-devel@lfdr.de>; Tue, 26 Nov 2019 08:54:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574754897;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oy5VFKyCNw39rfXJdYxgBCusbi8Wk1Sme8PBsm40YJE=;
	b=I4zwQrlezi8/ijU+Et0baz0lpzysdqCj9AJBmKsk08f/+X2gmEAcKGFE9x1p3K5q+N+5Kf
	CtmTWej6vVJSt4yRaaCjfuS3pzdr3eAVTxZ4MVSejYRk4qylLVVuW55IIOjF8ItUI/PkMl
	af5vnf+8yKLMKhBfSYUKivIQkx0rdNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-KU_Ol2_7M9m5IvkU1gyhrg-1; Tue, 26 Nov 2019 02:54:55 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F775593A0;
	Tue, 26 Nov 2019 07:54:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB1225D9CA;
	Tue, 26 Nov 2019 07:54:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B404A4BB65;
	Tue, 26 Nov 2019 07:54:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAPHPP0H026898 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 25 Nov 2019 12:25:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 635C1215AB06; Mon, 25 Nov 2019 17:25:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F8822026D69
	for <dm-devel@redhat.com>; Mon, 25 Nov 2019 17:25:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7AE918AE942
	for <dm-devel@redhat.com>; Mon, 25 Nov 2019 17:25:22 +0000 (UTC)
Received: from Galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-339-oppe5S7XNx-48s91FbRybw-1; Mon, 25 Nov 2019 12:25:19 -0500
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
	(envelope-from <bigeasy@linutronix.de>)
	id 1iZI6q-0003I3-RK; Mon, 25 Nov 2019 18:25:12 +0100
Date: Mon, 25 Nov 2019 18:25:12 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20191125172512.q65pmda66un3cm2e@linutronix.de>
References: <alpine.LRH.2.02.1911121057490.12815@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1911121057490.12815@file01.intranet.prod.int.rdu2.redhat.com>
X-MC-Unique: oppe5S7XNx-48s91FbRybw-1
X-MC-Unique: KU_Ol2_7M9m5IvkU1gyhrg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAPHPP0H026898
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 26 Nov 2019 02:54:20 -0500
Cc: Mike Snitzer <msnitzer@redhat.com>, Nikos Tsironis <ntsironis@arrikto.com>,
	Daniel Wagner <dwagner@suse.de>, linux-kernel@vger.kernel.org,
	Ilias Tsitsimpis <iliastsi@arrikto.com>, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, tglx@linutronix.de,
	Scott Wood <swood@redhat.com>, linux-rt-users@vger.kernel.org
Subject: Re: [dm-devel] [PATCH RT 1/2 v2] dm-snapshot: fix crash with the
	realtime kernel
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gMjAxOS0xMS0xMiAxMTowOTo1MSBbLTA1MDBdLCBNaWt1bGFzIFBhdG9ja2Egd3JvdGU6Cj4g
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQo+IC0tLSBsaW51eC0yLjYub3JpZy9kcml2ZXJzL21kL2RtLXNuYXAuYwkyMDE5
LTExLTEyIDE2OjQ0OjM2LjAwMDAwMDAwMCArMDEwMAo+ICsrKyBsaW51eC0yLjYvZHJpdmVycy9t
ZC9kbS1zbmFwLmMJMjAxOS0xMS0xMiAxNzowMTo0Ni4wMDAwMDAwMDAgKzAxMDAK4oCmCj4gIHN0
YXRpYyB2b2lkIGRtX2V4Y2VwdGlvbl90YWJsZV9sb2NrKHN0cnVjdCBkbV9leGNlcHRpb25fdGFi
bGVfbG9jayAqbG9jaykKPiAgewo+ICsjaWZuZGVmIENPTkZJR19QUkVFTVBUX1JUX0JBU0UKPiAg
CWhsaXN0X2JsX2xvY2sobG9jay0+Y29tcGxldGVfc2xvdCk7Cj4gIAlobGlzdF9ibF9sb2NrKGxv
Y2stPnBlbmRpbmdfc2xvdCk7Cj4gKyNlbHNlCj4gKwlzcGluX2xvY2sobG9jay0+bG9jayk7Cgpp
ZiB5b3UgYWxzbyBzZXQgdGhlIGxvd2VzdCBiaXQgZm9yIGNvbXBsZXRlX3Nsb3QgKyBwZW5kaW5n
X3Nsb3QgdGhlbgpwYXRjaCAyIG9mIHRoaXMgbWluaSBzZXJpZXMgd291bGRuJ3QgYmUgcmVxdWly
ZWQuIFRoYXQgbWVhbnMgd2UgY291bGQKa2VlcCB0aGUgZGVidWcgY29kZSBvbiAtUlQuIE9yIGFt
IEkgbWlzc2luZyBzb21ldGhpbmc/Cgo+ICsjZW5kaWYKPiAgfQoKU2ViYXN0aWFuCgoKLS0KZG0t
ZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

