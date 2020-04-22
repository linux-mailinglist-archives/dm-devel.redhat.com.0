Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 524851B4419
	for <lists+dm-devel@lfdr.de>; Wed, 22 Apr 2020 14:16:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587557777;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bWU3y0O08xl7q79ztPaxLfPugKZwPDo9jZ7wV0yAS8g=;
	b=Rtv9OWU9PMxdUeYdDT8XUVGFf+400Mdxok+3xdZ0cvzlZazfZfmEtZrwmZaDda1oYyFG2E
	8RRtVdFn1HRIS2WnOI/E3Cduu18GXGCutKYsUaKw2GFtr/sBjvNtHMLXXx8DdK9Q9VY2ee
	uGmtSo3F7tec1Jlg1Y14muevw3Y57YY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-3VRWQOX2OPa0mx9fbdtkEw-1; Wed, 22 Apr 2020 08:16:15 -0400
X-MC-Unique: 3VRWQOX2OPa0mx9fbdtkEw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1EAC193579B;
	Wed, 22 Apr 2020 12:16:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7721A1024837;
	Wed, 22 Apr 2020 12:16:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A110F1809541;
	Wed, 22 Apr 2020 12:16:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03M8erMV016338 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Apr 2020 04:40:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B3734F84F7; Wed, 22 Apr 2020 08:40:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF3F7F89E8
	for <dm-devel@redhat.com>; Wed, 22 Apr 2020 08:40:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C65C86BCD7
	for <dm-devel@redhat.com>; Wed, 22 Apr 2020 08:40:51 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
	[209.85.210.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-155-rqgMUatxPW24hvy-tl9FEQ-1; Wed, 22 Apr 2020 04:40:48 -0400
X-MC-Unique: rqgMUatxPW24hvy-tl9FEQ-1
Received: by mail-ot1-f53.google.com with SMTP id e20so1346526otk.12
	for <dm-devel@redhat.com>; Wed, 22 Apr 2020 01:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
	:content-transfer-encoding;
	bh=T8/83JjIWAu4tMoXbHXJpOPqrjSmw8/sQtmrK7Ezw1s=;
	b=UrNUoT2pBtmsXTdVRWCx5x3BMAwvvFoG3rW+hTcROEdOo/HOuIPolyUD4RnekIJK//
	b30YO5IZxqsRzQeBpDcgy4tyLf5zDyTKvtM6LO+ntxQcCGuVXimlnSrfJo1WRrQLkpLQ
	3DcOTqYpW+1ffK1g8xWRyFZ42vOgqiKlIvX+R3dJRN6R8w5JpmUKsIbbgFUm5B9pinN1
	qHG25n0ego/hgZdczixjrtr7Ss2nSgcKX5oR0S3U80x1NPWCKrFG4PGsnJbd0+bMzgJE
	QtcxmwEewFTcnwKNpJY41r2uTVwLd1oz6guqvcNGHlMIm2V0GCr1nbjNLfAiEk7/gexn
	GQHg==
X-Gm-Message-State: AGi0PuafLOPmzf8vazfzYN+SiCV0EsuEC4XJQ2NRNs8M9fo4K1qF4cfP
	3y3NvZ9Dejlx2t8K4Ck6iZzHfcSgFPDZ8dH70kW+auORJGw=
X-Google-Smtp-Source: APiQypJ8FzParJLXzxPbDzegBqoKKzGHwT3DuVY0ToaftLaRQjG0CIzDNT/RVmqIvRLxfODsBajZOMPkswhRpxVK6v4=
X-Received: by 2002:a9d:1d08:: with SMTP id m8mr16870884otm.364.1587544847876; 
	Wed, 22 Apr 2020 01:40:47 -0700 (PDT)
MIME-Version: 1.0
From: Gioh Kim <gi-oh.kim@cloud.ionos.com>
Date: Wed, 22 Apr 2020 10:40:12 +0200
Message-ID: <CAJX1YtZiGXdZTrGtw8ksP3khRf26jQ7dhBWoEJcGfQQZMGb-gg@mail.gmail.com>
To: dm-devel@redhat.com, christophe.varoqui@opensvc.com
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03M8erMV016338
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 22 Apr 2020 08:14:08 -0400
Cc: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
	Jinpu Wang <jinpu.wang@cloud.ionos.com>, mwilck@suse.com
Subject: [dm-devel] 'multipath add path' returns ok but the path is missing
	in the topology
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksCgpJIHdvdWxkIGxpa2UgdG8gcmVwb3J0IGEgYnVnLgpJIGFtIHVzaW5nIG5ldHdvcmsgc3Rv
cmFnZSB2aWEgU1JQL1NSUFQgb3ZlciBJbmZpbmliYW5kLgpXaGVuIGEgbmV3IHNkIGRldmljZSBp
cyBjcmVhdGVkIGJ5IFNSUCwgSSBleGVjdXRlICdtdWx0aXBhdGhkIGFkZCBwYXRoCnNkWCcgY29t
bWFuZCBhbmQgdGhlbiBhIG5ldyBtYXAgZGV2aWNlIGlzIGNyZWF0ZWQgYXV0b21hdGljYWxseS4K
CkkgdXNlZCB0byB1c2UgdGhlIGtlcm5lbCA0LjE0IHZlcnNpb24gYW5kIGhhZCBubyBwcm9ibGVt
LgpCdXQgYWZ0ZXIgdXBncmFkaW5nIHRvIGtlcm5lbCA0LjE5LCBJIGhhdmUgYSBwcm9ibGVtIHRo
YXQgJ211bHRpcGF0aAphZGQgcGF0aCBzZFgnIHJldHVybnMgb2sgYnV0IHNkWCBpcyBub3QgaW5j
bHVkZWQgaW4gdGhlIHRvcG9sb2d5LgoKRm9yIGV4YW1wbGUsIEkgcmFuICdtdWx0aXBhdGggYWRk
IHBhdGggc2RhaicgYW5kICdtdWx0aXBhdGggYWRkIHBhdGgKc2RhaycgYW5kIHRoZXkgcmV0dXJu
ZWQgb2suClRoZW4gSSBjaGVjayB0aGUgdG9wb2xvZ3kgd2l0aCAnbXVsdGlwYXRoZCBzaG93IHRv
cG9sb2d5JyBhbmQgc2RhayBpcyBtaXNzaW5nLgoKRm9sbG93aW5nIGlzIHRoZSBsb2cgbWVzc2Fn
ZSBmcm9tIG11bHRpcGF0aGQgZGFlbW9uLgpJIGZvdW5kIHRoYXQKMS4gYWRkaW5nIHNkYWogd2Fz
IGRvbmUgY29ycmVjdGx5IGFuZCBtYXAKMzYwMDE0NGYwMzMzMzdjZmMzY2E1MjIyMjAwMTk2MDAy
IGFuZCBkbS0xMSB3YXMgY3JlYXRlZAoyLiBkYWVtb24gc3RhcnRlZCBhZGRpbmcgc2RhayAoYWNj
b3JkaW5nIHRvICJzZGFrOiBhZGQgcGF0aCAob3BlcmF0b3IpIiBtZXNzYWdlKQozLiBzdWRkZW5s
eSBtYXAgZG0tMTEgd2FzIHJlbW92ZWQgYW5kIGNyZWF0ZWQKNC4gYWRkaW5nIHNkYWsgcmV0dXJu
ZWQgb2sgYnV0IHRoZXJlIHdhcyBubyAic2RhazogcGF0aCBhZGRlZCB0bwpkZXZtYXAgLi4iIG1l
c3NhZ2UuICBJIHdhaXRlZCBzb21lIG1pbnV0ZXMgYnV0IGl0IGRpZCBub3Qgc2hvdyB1cC4KSSBn
dWVzcyB0aGVyZSB3b3VsZCBiZSBzb21lIGNvcm5lciBjYXNlIGZvciBlcnJvciBoYW5kbGluZy4K
VGhlIG11bHRpcGF0aGQgbWlnaHQgaGF2ZSBhbiBlcnJvciBidXQgbm90IHJldHVybiBhbiBlcnJv
ci4KCgo8bG9nIG1lc3NhZ2U+Cm11bHRpcGF0aGRbMTkyMF06IHNkYWo6IGFkZCBwYXRoIChvcGVy
YXRvcikKbXVsdGlwYXRoZFsxOTIwXTogMzYwMDE0NGYwMzMzMzdjZmMzY2E1MjIyMjAwMTk2MDAy
OiBsb2FkIHRhYmxlIFswCjIxMDUzNDQgbXVsdGlwYXRoIDEgcmV0YWluX2F0dGFjaGVkX2h3X2hh
bmRsZXIgMCAxIDEgc2VydmljZS10aW1lIDAgMQoxIDY2OjQ4IDFdCm11bHRpcGF0aGRbMTkyMF06
IDM2MDAxNDRmMDMzMzM3Y2ZjM2NhNTIyMjIwMDE5NjAwMjogZXZlbnQgY2hlY2tlciBzdGFydGVk
Cm11bHRpcGF0aGRbMTkyMF06IHNkYWogWzY2OjQ4XTogcGF0aCBhZGRlZCB0byBkZXZtYXAKMzYw
MDE0NGYwMzMzMzdjZmMzY2E1MjIyMjAwMTk2MDAyCm11bHRpcGF0aGRbMTkyMF06IHNkYWs6IGFk
ZCBwYXRoIChvcGVyYXRvcikKbXVsdGlwYXRoZFsxOTIwXTogZG0tMTE6IHJlbW92ZSBtYXAgKHVl
dmVudCkKbXVsdGlwYXRoZFsxOTIwXTogMzYwMDE0NGYwMzMzMzdjZmMzY2E1MjIyMjAwMTk2MDAy
OiBzdG9wIGV2ZW50CmNoZWNrZXIgdGhyZWFkICgxMzk5NzYxNzc0NTY4OTYpCm11bHRpcGF0aGRb
MTkyMF06IGRtLTExOiByZW1vdmUgbWFwICh1ZXZlbnQpCm11bHRpcGF0aGRbMTkyMF06IDM2MDAx
NDRmMDMzMzM3Y2ZjM2NhNTIyMjIwMDE5NjAwMjogYWRkaW5nIG1hcAptdWx0aXBhdGhkWzE5MjBd
OiAzNjAwMTQ0ZjAzMzMzN2NmYzNjYTUyMjIyMDAxOTYwMDI6IGV2ZW50IGNoZWNrZXIgc3RhcnRl
ZAptdWx0aXBhdGhkWzE5MjBdOiAzNjAwMTQ0ZjAzMzMzN2NmYzNjYTUyMjIyMDAxOTYwMDI6IGRl
dm1hcCBkbS0xMSByZWdpc3RlcmVkCgo8bXVsdGlwYXRoZCBzaG93IHRvcG9sb2d5PgozNjAwMTQ0
ZjAzMzMzN2NmYzNjYTUyMjIyMDAxOTYwMDIgZG0tMTEgU0NTVF9CSU8sZTIxZjZmNjA1YzFkZmZm
NwpzaXplPTEuMEcgZmVhdHVyZXM9JzEgcmV0YWluX2F0dGFjaGVkX2h3X2hhbmRsZXInIGh3aGFu
ZGxlcj0nMCcgd3A9cm8KYC0rLSBwb2xpY3k9J3NlcnZpY2UtdGltZSAwJyBwcmlvPTEgc3RhdHVz
PWVuYWJsZWQKYC0gNzowOjA6NDg5IHNkYWogNjY6NDggIGFjdGl2ZSByZWFkeSBydW5uaW5nCgpJ
IHdlbGNvbWUgYW55IGNvbW1lbnQuCkkgdGhhbmsgeW91IGluIGFkdmFuY2UuClN0YXkgaGVhbHRo
eSEKCi0tIApHaW9oIEtpbQoKQ2xvdWQgc2VydmVyIGtlcm5lbCBtYWludGFpbmVyClF1YWxpdHkg
TWFuYWdlbWVudCAoSU9OT1MgQ2xvdWQpCgoxJjEgSU9OT1MgU0UgfCBHcmVpZnN3YWxkZXIgU3Ry
LiAyMDcgfCAxMDQwNSBCZXJsaW4gfCBHZXJtYW55ClBob25lOiArNDkgMTc2IDI2OTc4OTYyCkUt
bWFpbDogZ2ktb2gua2ltQGNsb3VkLmlvbm9zLmNvbSB8IFdlYjogd3d3Lmlvbm9zLmRlCgpIYXVw
dHNpdHogTW9udGFiYXVyLCBBbXRzZ2VyaWNodCBNb250YWJhdXIsIEhSQiAyNDQ5OAoKVm9yc3Rh
bmQ6IERyLiBDaHJpc3RpYW4gQsO2aW5nLCBIw7xzZXlpbiBEb2dhbiwgRHIuIE1hcnRpbiBFbmRy
ZcOfLApIYW5zLUhlbm5pbmcgS2V0dGxlciwgQXJ0aHVyIE1haSwgTWF0dGhpYXMgU3RlaW5iZXJn
LCBBY2hpbSBXZWnDnwpBdWZzaWNodHNyYXRzdm9yc2l0emVuZGVyOiBNYXJrdXMgS2FkZWxrZQoK
TWVtYmVyIG9mIFVuaXRlZCBJbnRlcm5ldAoKRGllc2UgRS1NYWlsIGthbm4gdmVydHJhdWxpY2hl
IHVuZC9vZGVyIGdlc2V0emxpY2ggZ2VzY2jDvHR6dGUKSW5mb3JtYXRpb25lbiBlbnRoYWx0ZW4u
IFdlbm4gU2llIG5pY2h0IGRlciBiZXN0aW1tdW5nc2dlbcOkw59lIEFkcmVzc2F0CnNpbmQgb2Rl
ciBkaWVzZSBFLU1haWwgaXJydMO8bWxpY2ggZXJoYWx0ZW4gaGFiZW4sIHVudGVycmljaHRlbiBT
aWUKYml0dGUgZGVuIEFic2VuZGVyIHVuZCB2ZXJuaWNodGVuIFNpZSBkaWVzZSBFLU1haWwuIEFu
ZGVyZW4gYWxzIGRlbQpiZXN0aW1tdW5nc2dlbcOkw59lbiBBZHJlc3NhdGVuIGlzdCB1bnRlcnNh
Z3QsIGRpZXNlIEUtTWFpbCB6dQpzcGVpY2hlcm4sIHdlaXRlcnp1bGVpdGVuIG9kZXIgaWhyZW4g
SW5oYWx0IGF1ZiB3ZWxjaGUgV2Vpc2UgYXVjaAppbW1lciB6dSB2ZXJ3ZW5kZW4uCgpUaGlzIGUt
bWFpbCBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgYW5kL29yIHByaXZpbGVnZWQgaW5mb3JtYXRp
b24uIElmCnlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWws
IHlvdSBhcmUgaGVyZWJ5Cm5vdGlmaWVkIHRoYXQgc2F2aW5nLCBkaXN0cmlidXRpb24gb3IgdXNl
IG9mIHRoZSBjb250ZW50IG9mIHRoaXMKZS1tYWlsIGluIGFueSB3YXkgaXMgcHJvaGliaXRlZC4g
SWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4KZXJyb3IsIHBsZWFzZSBub3RpZnkg
dGhlIHNlbmRlciBhbmQgZGVsZXRlIHRoZSBlLW1haWwuCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBs
aXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2RtLWRldmVs

