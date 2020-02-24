Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D14C616A7D4
	for <lists+dm-devel@lfdr.de>; Mon, 24 Feb 2020 15:04:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582553079;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8tKISxhap+mt150yE6FgHhNdUJvmaIBk/oMiGRvg6m0=;
	b=arL66SgaopKtT8BJymT8sLPTo0r7PiEPYCrbdPtU10mnlW1uCSteeXM3OmYOb4rVCDsvxr
	3684MPqsGMMjd/fqi+NAtU8W46e45VWJph1EMqJvsP3W4weuEDk5z5M3S5AwntQ5X+bt/b
	pH14GrzlVH1LzhnxFWHz2yvKwRKOiTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-ZnfIUWjrNf63FtVTRvnoLQ-1; Mon, 24 Feb 2020 09:04:37 -0500
X-MC-Unique: ZnfIUWjrNf63FtVTRvnoLQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCCA5800EB4;
	Mon, 24 Feb 2020 14:04:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 698015D9CD;
	Mon, 24 Feb 2020 14:04:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5111B860EC;
	Mon, 24 Feb 2020 14:04:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01OE4Eh0022136 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 09:04:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DDA715C105; Mon, 24 Feb 2020 14:04:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from ovpn-116-241.phx2.redhat.com (ovpn-116-241.phx2.redhat.com
	[10.3.116.241])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9961C5C114;
	Mon, 24 Feb 2020 14:04:11 +0000 (UTC)
From: Brassow Jonathan <jbrassow@redhat.com>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Message-Id: <815B7F0F-574E-4DE2-BF28-7C5831BADAEE@redhat.com>
Date: Mon, 24 Feb 2020 08:04:11 -0600
To: dm-devel@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01OE4Eh0022136
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [Job Posting] There is a position open in Red Hat for
 working on device-mapper
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksCgpBcG9sb2dpZXMgZm9yIGhpamFja2luZyB0aGUgbWFpbGluZyBsaXN0IHRvIHNvbGljaXQg
am9iIHBvc3RpbmdzLCBidXQgdGhpcyBvbmUgc2VlbXMgZXNwZWNpYWxseSBvbi1wb2ludC4KCldl
IGhhdmUgYSBqb2Igb3BlbmluZyBpbiBSZWQgSGF0IGZvciBkZXZpY2UtbWFwcGVyIGFuZCByZWxh
dGVkIHByb2R1Y3RzIGRldmVsb3BtZW50LiAgVGhlIHBvc2l0aW9uIGFuZCBzYWxhcnkgYXJlIGJh
c2VkIGluIEJybm8sIEN6ZWNoIFJlcHVibGljOyBidXQgd29ya2luZyByZW1vdGVseSBmcm9tIGp1
c3QgYWJvdXQgYW55d2hlcmUgd291bGQgYmUgZmluZSBhcyB3ZWxsLiAgV2UgaGF2ZSBhIG5lZWQg
Zm9yIGEgcmFuZ2Ugb2Ygc2tpbGxzIGZyb20gdGhlIG1vcmUganVuaW9yIHRvIG1vcmUgc2VuaW9y
IGRldmVsb3Blci4gIElmIHlvdSBhcmUgZmx1ZW50IGluIOKAmEPigJksIGZhbWlsaWFyIHdpdGgg
c3RvcmFnZSwgYW5kIGludGVyZXN0ZWQgaW4gd29ya2luZyBhdCBSZWQgSGF0OyBwbGVhc2UgcHV0
IGluIGFuIGFwcGxpY2F0aW9uWzFdLgoKVGhhbmtzLApicmFzc293CgpbMV0gaHR0cHM6Ly9nbG9i
YWwtcmVkaGF0LmljaW1zLmNvbS9qb2JzLzc0NDU5L3Nlbmlvci1zb2Z0d2FyZS1lbmdpbmVlci0t
LXNvZnR3YXJlLWRlZmluZWQtc3RvcmFnZS9qb2I/aHViPTcmbW9iaWxlPWZhbHNlJndpZHRoPTEx
NDAmaGVpZ2h0PTUwMCZiZ2E9dHJ1ZSZuZWVkc1JlZGlyZWN0PWZhbHNlJmphbjFvZmZzZXQ9LTM2
MCZqdW4xb2Zmc2V0PS0zMDAKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRo
YXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

