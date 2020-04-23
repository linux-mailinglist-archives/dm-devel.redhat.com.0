Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D29981B6F60
	for <lists+dm-devel@lfdr.de>; Fri, 24 Apr 2020 09:49:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587714544;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qRyTss/EtYa7fSaA3dgPcLF6q5ZNZaLS1UXmKyMJRAY=;
	b=MbE3rwUL7RR85NSQrwM57TDYEn2ALG6JA1lvNr6x0IIlqsYuVxAMfS2CcQsWIDx1DAI2x0
	DV+3LImx7BrNDtypJe2m5ZRpABlVst9NPjo1lAPYCyNuW4hFdPry1ism6Dxsm06sA9Lj2u
	NKzmW9XbMqaIKuW7dMV+MGgj5/QBbGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465--S7L108gMDSND0SEEFAjTQ-1; Fri, 24 Apr 2020 03:49:02 -0400
X-MC-Unique: -S7L108gMDSND0SEEFAjTQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 782A518FF661;
	Fri, 24 Apr 2020 07:48:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E5A56084C;
	Fri, 24 Apr 2020 07:48:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DD8251809543;
	Fri, 24 Apr 2020 07:48:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03NBKdZp020983 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 Apr 2020 07:20:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CCD611006B25; Thu, 23 Apr 2020 11:20:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C85DE10166FE
	for <dm-devel@redhat.com>; Thu, 23 Apr 2020 11:20:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2484101A526
	for <dm-devel@redhat.com>; Thu, 23 Apr 2020 11:20:37 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-16-cd70wdOsNTO19vBGu9RWtA-1; Thu, 23 Apr 2020 07:20:35 -0400
X-MC-Unique: cd70wdOsNTO19vBGu9RWtA-1
Received: by mail-pf1-f195.google.com with SMTP id w65so2769557pfc.12;
	Thu, 23 Apr 2020 04:20:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bWdeqdp9TU7ILFl/QXzKQZ4N2Scr9g8CdwKqx19r958=;
	b=NrpqR8YbCtAuoLEC9X3dO3VuFBwTe57B2vnVM3L3MICrAT+egy14GK1e7Iz1asDAyp
	LIH64faePVueFACLmZGXgzDNm06FsqDbmO1KrwkfyxuLg9gMJyZ8uNf/IBRrBzWdhcja
	I71N6ZHhaKbXBz+YKSf/ygrL3L0e9kCP3Jzk7kIFG/WZCJSJ6u7+yQ/l6ZIDKn/V/rW2
	8dzUfOGtSGEQOdZP/4fRySw+7xBl0r7+0WOgdZGhdN7EaOG1xktoi9a+y46ZnJocHEr5
	QWX3xp86bXAndURO7zqkRrQcv4wTNMok+NILpSf2RtHvI/wncE9XSYDLedISAPYP0c/6
	+fAA==
X-Gm-Message-State: AGi0PuYNsUzZkHsnDJGP9G6Eu3PYGni//kp7ivxC084MqqcxwP/Tv+bZ
	f3lUbxSSG77VUgNJbH9sx8uV5mcxVBGfOSpb8FbjLa45
X-Google-Smtp-Source: APiQypL/XHy723hXp/OBEwYuKT2+j1XDKiCom8eiZ+6nh4qzWtO+NlJ5Tzp0dBtHrXj9+u97PLJ3dOFdYLbY2qbZNaM=
X-Received: by 2002:aa7:91c9:: with SMTP id z9mr3326622pfa.17.1587640833745;
	Thu, 23 Apr 2020 04:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200420134659.1640089-1-dbaryshkov@gmail.com>
	<20200421182754.GA49104@lobo>
	<CALT56yMxxCFX_j=A9YKysPcuBWs2a0iJbCXuE2q1iqy3irOxdA@mail.gmail.com>
	<20200421185949.GA52939@lobo>
In-Reply-To: <20200421185949.GA52939@lobo>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Thu, 23 Apr 2020 14:20:21 +0300
Message-ID: <CALT56yPH65zxTo0-aVBK+Fzuq10zw-e2e2KtXw2pCQWGhAg1Gg@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03NBKdZp020983
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 24 Apr 2020 03:48:26 -0400
Cc: Dmitry Baryshkov <dmitry_baryshkov@mentor.com>, dm-devel@redhat.com,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm-crypt: support using encrypted keys
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

SGVsbG8sCgrQstGCLCAyMSDQsNC/0YAuIDIwMjAg0LMuINCyIDIxOjU5LCBNaWtlIFNuaXR6ZXIg
PHNuaXR6ZXJAcmVkaGF0LmNvbT46Cj4KPiBPbiBUdWUsIEFwciAyMSAyMDIwIGF0ICAyOjMyUCAt
MDQwMCwKPiBEbWl0cnkgQmFyeXNoa292IDxkYmFyeXNoa292QGdtYWlsLmNvbT4gd3JvdGU6Cj4K
PiA+INCy0YIsIDIxINCw0L/RgC4gMjAyMCDQsy4g0LIgMjE6MjcsIE1pa2UgU25pdHplciA8c25p
dHplckByZWRoYXQuY29tPjoKPiA+ID4KPiA+ID4gT24gTW9uLCBBcHIgMjAgMjAyMCBhdCAgOTo0
NlAgLTA0MDAsCj4gPiA+IERtaXRyeSBCYXJ5c2hrb3YgPGRiYXJ5c2hrb3ZAZ21haWwuY29tPiB3
cm90ZToKPiA+ID4KPiA+ID4gPiBGcm9tOiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnlfYmFyeXNo
a292QG1lbnRvci5jb20+Cj4gPiA+ID4KPiA+ID4gPiBBbGxvdyBvbmUgdG8gdXNlIGVuY3J5cHRl
ZCBpbiBhZGRpdGlvbiB0byB1c2VyIGFuZCBsb2dpbiBrZXkgdHlwZXMgZm9yCj4gPiA+ID4gZGV2
aWNlIGVuY3J5cHRpb24uCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgQmFy
eXNoa292IDxkbWl0cnlfYmFyeXNoa292QG1lbnRvci5jb20+Cj4gPiA+Cj4gPiA+IEkgZml4ZWQg
dXAgc29tZSBpc3N1ZXMsIHBsZWFzZSBzZWUgdGhlIGZvbGxvd2luZyBpbmNyZW1lbnRhbCBwYXRj
aCwKPiA+ID4gSSdsbCBnZXQgdGhpcyBmb2xkZWQgaW4gYW5kIHN0YWdlZCBmb3IgNS44Lgo+ID4K
PiA+IFRoYW5rIHlvdSEKPgo+IEFjdHVhbGx5LCBJIHRoaW5rIHRoaXMgaXMgbmVlZGVkIHRvbyAt
LSBidXQgcGxlYXNlIGNvcnJlY3QgbWUgaWYgSSdtIHdyb25nOgoKWWVzLCBpdCBsb29rcyBsaWtl
IGEgY29ycmVjdCBjaGFuZ2UgdG8gbWUuCgo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWQvZG0t
Y3J5cHQuYyBiL2RyaXZlcnMvbWQvZG0tY3J5cHQuYwo+IGluZGV4IGE0YzRhZmM2N2EzZC4uYmE0
ZDE1NDc2ODYyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWQvZG0tY3J5cHQuYwo+ICsrKyBiL2Ry
aXZlcnMvbWQvZG0tY3J5cHQuYwo+IEBAIC0yMjM1LDggKzIyMzUsOSBAQCBzdGF0aWMgaW50IHNl
dF9rZXlfdXNlcihzdHJ1Y3QgY3J5cHRfY29uZmlnICpjYywgc3RydWN0IGtleSAqa2V5KQo+Cj4g
IHN0YXRpYyBpbnQgc2V0X2tleV9lbmNyeXB0ZWQoc3RydWN0IGNyeXB0X2NvbmZpZyAqY2MsIHN0
cnVjdCBrZXkgKmtleSkKPiAgewo+IC0gICAgICAgc3RydWN0IGVuY3J5cHRlZF9rZXlfcGF5bG9h
ZCAqZWtwID0ga2V5LT5wYXlsb2FkLmRhdGFbMF07Cj4gKyAgICAgICBjb25zdCBzdHJ1Y3QgZW5j
cnlwdGVkX2tleV9wYXlsb2FkICpla3A7Cj4KPiArICAgICAgIGVrcCA9IGRlcmVmZXJlbmNlX2tl
eV9sb2NrZWQoa2V5KTsKPiAgICAgICAgIGlmICghZWtwKQo+ICAgICAgICAgICAgICAgICByZXR1
cm4gLUVLRVlSRVZPS0VEOwo+CgoKLS0gCldpdGggYmVzdCB3aXNoZXMKRG1pdHJ5CgoKLS0KZG0t
ZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

