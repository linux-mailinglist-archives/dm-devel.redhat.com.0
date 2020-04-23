Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4E51B6F62
	for <lists+dm-devel@lfdr.de>; Fri, 24 Apr 2020 09:49:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587714546;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Jg7wXMvC/linrlF7anvtvgoh92T4ysVYTTUw/LQxeUI=;
	b=GRzt7C9XkwyZtxtHpgr7AvV6QRMjOuAIjfU4Vr+UfCPUyDZDQJel+LjOGRz+FrRy0RrIBv
	ew28PSjXVr8ddcs9druYfel40WtKs0LNj6kVMQ5BB8hgmO5yBUbfyRm07R8D+JdQ9mVNGx
	9bBNEtHnCYjnBA8vcv+bLtPGuOKrslQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-EUK4-HO_PgKn9LNwJFBrvw-1; Fri, 24 Apr 2020 03:49:03 -0400
X-MC-Unique: EUK4-HO_PgKn9LNwJFBrvw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC96A64ACA;
	Fri, 24 Apr 2020 07:48:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD7061C94C;
	Fri, 24 Apr 2020 07:48:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B4D1180954D;
	Fri, 24 Apr 2020 07:48:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03NB38ar020172 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 Apr 2020 07:03:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6F3A5B551C; Thu, 23 Apr 2020 11:03:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B6E0B5536
	for <dm-devel@redhat.com>; Thu, 23 Apr 2020 11:03:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 100DA800141
	for <dm-devel@redhat.com>; Thu, 23 Apr 2020 11:03:06 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-45-POnF8Z39OV6RrmY3w65mzw-1; Thu, 23 Apr 2020 07:03:00 -0400
X-MC-Unique: POnF8Z39OV6RrmY3w65mzw-1
Received: by mail-pl1-f196.google.com with SMTP id c21so1390660plz.4;
	Thu, 23 Apr 2020 04:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=3zbTXu8RxyjlrG96JmbjJtlIlX5XTPY1gVONCg8GDf4=;
	b=Nahk3YLSrXPosMu5yKNmhGa0LlIjgEfxXh0H7jxUpuvmjgw5a7jrMbwTmt5+VGlgZG
	Hg8DV4SpP6AufAn61NE+S2QrHi7ZK8eKLMMSQ7bI6zlyW0ozp2t1PYZGMZEj6RMVbK+A
	SkEhMfD3Qbnp8zyiJ8v1SKWjT5JnVS7yYA3jDipWUwDAiysJeks7kze5liEUhtMj4U8R
	H19WTse4s3UNr3HzKN05D7X3GWcvNsFO5e7iEewXjd4GObjQryH/1JLUmrKJgVlpi51S
	y3lxqkaniDVmw32qiB0WoVnjRFVcI89jz0d8NwwqxV4M059M5SqEgmF0s1zX2rRMF7U9
	KTmA==
X-Gm-Message-State: AGi0PubSTYlhE8ElNScMs3FZDuGD4pRF3MjlN7fkKfuHtE7i2UlQ2agI
	V7RZ5RjzNwChIluv+wePvAkVAVR7ma0N+Mp+2dg=
X-Google-Smtp-Source: APiQypI2X/fwFoTbpULQMh8CgrP5yV+zAWbpqOvxoCWduh9+IJw6Cf2Q04eF7KtMPtGOXrNBa2NRHlnW8TOMnYUaui0=
X-Received: by 2002:a17:90a:20ea:: with SMTP id
	f97mr168671pjg.157.1587639778976; 
	Thu, 23 Apr 2020 04:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200420134659.1640089-1-dbaryshkov@gmail.com>
	<20200421182754.GA49104@lobo>
	<e3b78a32-4307-c60c-f9c3-dd6d71b6633c@gmail.com>
	<20200422214052.GA10695@redhat.com>
	<67eedf43-7afb-3c2e-704a-d0ac187d6a4b@gmail.com>
In-Reply-To: <67eedf43-7afb-3c2e-704a-d0ac187d6a4b@gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Thu, 23 Apr 2020 14:02:42 +0300
Message-ID: <CALT56yOgN6RyKxd3DOhZT11xDxmkQTQRzNmZo4ugWnjq-idfWw@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03NB38ar020172
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 24 Apr 2020 03:48:26 -0400
Cc: Dmitry Baryshkov <dmitry_baryshkov@mentor.com>,
	David Howells <dhowells@redhat.com>, dm-devel@redhat.com,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sCgrRh9GCLCAyMyDQsNC/0YAuIDIwMjAg0LMuINCyIDA5OjQ3LCBNaWxhbiBCcm96IDxn
bWF6eWxhbmRAZ21haWwuY29tPjoKPgo+IE9uIDIyLzA0LzIwMjAgMjM6NDAsIE1pa2UgU25pdHpl
ciB3cm90ZToKPiA+IE9uIFdlZCwgQXByIDIyIDIwMjAgYXQgMTI6NDdwbSAtMDQwMCwKPiA+IE1p
bGFuIEJyb3ogPGdtYXp5bGFuZEBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+PiBPbiAyMS8wNC8y
MDIwIDIwOjI3LCBNaWtlIFNuaXR6ZXIgd3JvdGU6Cj4gPj4+IE9uIE1vbiwgQXByIDIwIDIwMjAg
YXQgIDk6NDZQIC0wNDAwLAo+ID4+PiBEbWl0cnkgQmFyeXNoa292IDxkYmFyeXNoa292QGdtYWls
LmNvbT4gd3JvdGU6Cj4gPj4+Cj4gPj4+PiBGcm9tOiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnlf
YmFyeXNoa292QG1lbnRvci5jb20+Cj4gPj4+Pgo+ID4+Pj4gQWxsb3cgb25lIHRvIHVzZSBlbmNy
eXB0ZWQgaW4gYWRkaXRpb24gdG8gdXNlciBhbmQgbG9naW4ga2V5IHR5cGVzIGZvcgo+ID4+Pj4g
ZGV2aWNlIGVuY3J5cHRpb24uCj4gPj4+Pgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IEJh
cnlzaGtvdiA8ZG1pdHJ5X2JhcnlzaGtvdkBtZW50b3IuY29tPgo+ID4+Pgo+ID4+PiBJIGZpeGVk
IHVwIHNvbWUgaXNzdWVzLCBwbGVhc2Ugc2VlIHRoZSBmb2xsb3dpbmcgaW5jcmVtZW50YWwgcGF0
Y2gsCj4gPj4+IEknbGwgZ2V0IHRoaXMgZm9sZGVkIGluIGFuZCBzdGFnZWQgZm9yIDUuOC4KPiA+
Pgo+ID4+IEFuZCB5b3UganVzdCBjcmVhdGVkIGhhcmQgZGVwZW5kZW5jZSBvbiBlbmNyeXB0ZWQg
a2V5IHR5cGUuLi4KPiA+Pgo+ID4+IElmIHlvdSBkaXNhYmxlIHRoaXMgdHlwZSAoQ09ORklHX0VO
Q1JZUFRFRF9LRVlTIG9wdGlvbiksIGl0IGNhbm5vdCBsb2FkIHRoZSBtb2R1bGUgYW55bW9yZToK
PiA+PiBFUlJPUjogbW9kcG9zdDogImtleV90eXBlX2VuY3J5cHRlZCIgW2RyaXZlcnMvbWQvZG0t
Y3J5cHQua29dIHVuZGVmaW5lZCEKPiA+Cj4gPiBZZXMsIEkgd2FzIG1hZGUgYXdhcmUgdmlhIGxp
bnV4LW5leHQgbGFzdCBuaWdodC4KCkknbSBzb3JyeSBmb3IgdGhpcy4KCj4gPgo+ID4+IFdlIGhh
ZCB0aGlzIGlkZWEgYmVmb3JlLCBhbmQgdGhpcyBpbXBsZW1lbnRhdGlvbiBpbiBkbS1jcnlwdCBq
dXN0IHJlcXVpcmVzIGR5bmFtaWMKPiA+PiBrZXkgdHlwZSBsb2FkaW5nIGltcGxlbWVudGVkIGZp
cnN0Lgo+ID4+Cj4gPj4gRGF2aWQgSG93ZWxscyAoY2MpIHByb21pc2VkIHRoYXQgbW90aHMgYWdv
LCBidXQgYXBwYXJlbnRseSBub3RoaW5nIHdhcyB5ZXQgc3VibWl0dGVkCj4gPj4gKGFuZCB0aGUg
cHJvb2Ytb2YtY29uY2VwdCBwYXRjaCBubyBsb25nZXIgd29ya3MpLgo+ID4KPiA+IFdoeSBpcyBp
dCBzbyBiYWQgZm9yIGRtLWNyeXB0IHRvIGRlcGVuZCBvbiBDT05GSUdfRU5DUllQVEVEX0tFWVMg
d2hpbGUKPiA+IHdlIHdhaXQgZm9yIHRoZSBpbm5vdmF0aW9uIGZyb20gRGF2aWQ/Cj4KPiBQZW9w
bGUgbmVlZCB0byBjb21waWxlIGtlcm5lbCB3aXRoIHNwZWNpZmljIGZlYXR1cmVzIGRpc2FibGVk
LCBldmVuIHdpdGhvdXQga2V5cmluZyBzb21ldGltZXMuCj4gV2UgYWxzbyBzdXBwb3J0IHdob2xl
IENPTkZJR19LRVlTIGRpc2FibGUgLSBhbmQgaXQgbWFrZXMgc2Vuc2UgZm9yIHNvbWUgc21hbGwg
YXBwbGlhbmNlcy4KPgo+IEluIGZhY3QgSSBoYWQgc2ltaWxhciBwYXRjaCAoc3VwcG9ydCBmb3Ig
ZW5jcnlwdGVkK3RydXN0ZWQga2V5ZXMpIGZvciBkbS1jcnlwdCBmb3IgbW9udGhzLAo+IHdpdGgg
YWRkaXRpb25hbCBwYXRjaCB0aGF0IGxvYWRzIGtleSB0eXBlcyBwZXIgcmVxdWVzdHMgKHNvIGl0
IGNhbiBmYWlsIGlmIHRoZSB0eXBlIGlzIG5vdCBhdmFpbGFibGUpLgo+IEl0IHVzZXMga2V5X3R5
cGVfbG9va3VwIGZ1bmN0aW9uIGV4cG9ydGVkLiBJTU8gdGhpcyBpcyB0aGUgd2F5IHRvIGdvLgoK
SSd2ZSBhbHNvIGhhZCBhIHBhdGNoIHVzaW5nIGtleV90eXBlX2xvb2t1cCgpLiBIb3dldmVyIEkg
ZW5kZWQgdXAKZHJvcHBpbmcgaXQgYmVjYXN1ZSBlYWNoIGtleSB0eXBlIHN0aWxsIG5lZWRzIHR5
cGUtc3BlY2lmaWMgZnVuY3Rpb24KdG8gYWNjZXNzIGtleSBwYXlsb2FkLiBVbmxlc3Mgd2UgYWxz
byBhZGQgYW4gQVBJIHRvIGFjY2VzcyBwYXlsb2FkcyBpbgphIHR5cGUtbmV1dHJhbCB3YXksIGl0
IGRvZXMgbm90IG1ha2Ugc2Vuc2UuCgo+IFNvIHRoZSBpZGVhIGlzIGdvb2QsIGJ1dCBwbGVhc2Ug
a2VlcCBwb3NzaWJpbGl0eSB0byBkaXNhYmxlIGl0Lgo+IEFkZGl0aW9uYWwgZGVwZW5kZW5jaWVz
IG5vdCBvbmx5IGNhdXNlIHByb2JsZW1zIGFib3ZlLCBidXQgYWxzbyBjYW4gZ2V0IHNvbWUgZmFp
bHVyZXMgZnJvbSBpbml0cmQKPiB3aGVyZSB0aGUgbmV3IG1vZHVsZSBpcyBtaXNzaW5nICh0aGF0
IGhhcHBlbmVkIHNldmVyYWwgdGltZXMsIGl0IGlzIGp1c3QgcHJvYmxlbQo+IHRoYXQgY2FuIGJl
IGVhc2lseSBhdm9pZGVkKS4KCkl0IGxvb2tzIGxpa2UgTWlrZSBoYXMgYWxyZWFkeSBmaXhlZCBp
dC4gU28gdGhhbmtzIGEgbG90IGFuZCBzb3JyeSBmb3IKdGhlIGlzc3VlcyBjYXVzZWQgYnkgdGhl
IHBhdGNoLgoKCi0tIApXaXRoIGJlc3Qgd2lzaGVzCkRtaXRyeQoKCi0tCmRtLWRldmVsIG1haWxp
bmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1h
bi9saXN0aW5mby9kbS1kZXZlbA==

