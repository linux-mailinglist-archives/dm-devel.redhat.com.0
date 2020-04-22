Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id BEF341B6F5E
	for <lists+dm-devel@lfdr.de>; Fri, 24 Apr 2020 09:49:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587714542;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UI1Gs+S+gU5aWyxaoYxR42y9r26LBw9hJ/jY9K+QeDk=;
	b=fILwFyArC69O1aToPO5+cqNkOxewzr7hHaLIpbKdKJNXO2P0s2mY9Mk2YLiu7qgbAtAqSb
	swmxZs6QyeimW83pb7X+cAilwBK3pvOAbbibl8f8ogSgNgx17aHeTnT2N7YAB3QFkbiWKu
	UImhR7FtHK7u9b8mzGRJBDWKAISIBBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-cJwoq2MgMpm3ka_s55g01w-1; Fri, 24 Apr 2020 03:48:59 -0400
X-MC-Unique: cJwoq2MgMpm3ka_s55g01w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C572468;
	Fri, 24 Apr 2020 07:48:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D8C75C1C8;
	Fri, 24 Apr 2020 07:48:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A37E4CA95;
	Fri, 24 Apr 2020 07:48:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03ME14Zc008636 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Apr 2020 10:01:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 579402166B29; Wed, 22 Apr 2020 14:01:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53BF92166B27
	for <dm-devel@redhat.com>; Wed, 22 Apr 2020 14:01:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A902185A793
	for <dm-devel@redhat.com>; Wed, 22 Apr 2020 14:01:02 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
	[209.85.210.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-393--ygTZ1ZWPgCnWCsRniOPsA-1; Wed, 22 Apr 2020 10:00:58 -0400
X-MC-Unique: -ygTZ1ZWPgCnWCsRniOPsA-1
Received: by mail-ot1-f48.google.com with SMTP id m13so2066784otf.6
	for <dm-devel@redhat.com>; Wed, 22 Apr 2020 07:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=q6hPpG7+QBfttnZuLh/FDKMGNLU/7m2uOTmaRQxICm4=;
	b=Zfqx0C37cZkbuoYJV/qDT++R52RRVSWkc8F8V10milPGuF2L1xjiExmBjXA2X6KZoh
	hYRoPRkikJ+f5OLXJYhBPA3cHJMyYftoXSJgrQwzBIRN3ros1OZxZ+W4sCYn5GV1VDRt
	f+FCqWuxBE6jsAiK7rpIIZQ+xdtXYHrAUFiwNz0BK8oDnPQ5GOs8vS0GZLwFc2PArCPX
	d/nZmyXiwS+qt2041zpakfcuX2HuCGGwNO/vY0Ih+I8gq3xpQ4+BS3wvnf7Q1zLZxgkX
	Rn0yeTmfbtIwtzyeBGwTteGB5sF+JITIaeJbB/g2CjSWzX572RCpvSd9CQQ51bIA+Ro/
	SwBg==
X-Gm-Message-State: AGi0PuZZYoE9nTTvcTZJKYbFDmx1KdW3XX7C0xdSYhEWcO4YPTkZmp6A
	lPUAXz6F5i41arOFUDqTcAS/599Ipud3K0nA8kn/SQ==
X-Google-Smtp-Source: APiQypJuDy96Fo3IF4n+Sd23jnYjmietPfLDuo+sw6yaOU2DMsUZnf0i1ApJ8UYnirRexwTxCPr4RYNQXsWGd3y9iuw=
X-Received: by 2002:a9d:1d08:: with SMTP id m8mr17849073otm.364.1587564056483; 
	Wed, 22 Apr 2020 07:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAJX1YtZiGXdZTrGtw8ksP3khRf26jQ7dhBWoEJcGfQQZMGb-gg@mail.gmail.com>
	<086d3e2baae71658539ac7caf634336ea0927c04.camel@suse.com>
In-Reply-To: <086d3e2baae71658539ac7caf634336ea0927c04.camel@suse.com>
From: Gioh Kim <gi-oh.kim@cloud.ionos.com>
Date: Wed, 22 Apr 2020 16:00:20 +0200
Message-ID: <CAJX1YtaKhjLNN56rvwAXh7tOP1Egbo1izmFn3OUEhD4c489E1w@mail.gmail.com>
To: Martin Wilck <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03ME14Zc008636
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 24 Apr 2020 03:48:26 -0400
Cc: dm-devel@redhat.com, Jinpu Wang <jinpu.wang@cloud.ionos.com>,
	Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Subject: Re: [dm-devel] 'multipath add path' returns ok but the path is
	missing in the topology
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgTWFydGluLAoKT24gV2VkLCBBcHIgMjIsIDIwMjAgYXQgMTI6MDUgUE0gTWFydGluIFdpbGNr
IDxtd2lsY2tAc3VzZS5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gR2lvaCwKPgo+IE9uIFdlZCwgMjAy
MC0wNC0yMiBhdCAxMDo0MCArMDIwMCwgR2lvaCBLaW0gd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPiBJ
IHdvdWxkIGxpa2UgdG8gcmVwb3J0IGEgYnVnLgo+ID4gSSBhbSB1c2luZyBuZXR3b3JrIHN0b3Jh
Z2UgdmlhIFNSUC9TUlBUIG92ZXIgSW5maW5pYmFuZC4KPiA+IFdoZW4gYSBuZXcgc2QgZGV2aWNl
IGlzIGNyZWF0ZWQgYnkgU1JQLCBJIGV4ZWN1dGUgJ211bHRpcGF0aGQgYWRkCj4gPiBwYXRoCj4g
PiBzZFgnIGNvbW1hbmQgYW5kIHRoZW4gYSBuZXcgbWFwIGRldmljZSBpcyBjcmVhdGVkIGF1dG9t
YXRpY2FsbHkuCj4gPgo+ID4gSSB1c2VkIHRvIHVzZSB0aGUga2VybmVsIDQuMTQgdmVyc2lvbiBh
bmQgaGFkIG5vIHByb2JsZW0uCj4gPiBCdXQgYWZ0ZXIgdXBncmFkaW5nIHRvIGtlcm5lbCA0LjE5
LCBJIGhhdmUgYSBwcm9ibGVtIHRoYXQgJ211bHRpcGF0aAo+ID4gYWRkIHBhdGggc2RYJyByZXR1
cm5zIG9rIGJ1dCBzZFggaXMgbm90IGluY2x1ZGVkIGluIHRoZSB0b3BvbG9neS4KPiA+Cj4gPiBG
b3IgZXhhbXBsZSwgSSByYW4gJ211bHRpcGF0aCBhZGQgcGF0aCBzZGFqJyBhbmQgJ211bHRpcGF0
aCBhZGQgcGF0aAo+ID4gc2RhaycgYW5kIHRoZXkgcmV0dXJuZWQgb2suCj4gPiBUaGVuIEkgY2hl
Y2sgdGhlIHRvcG9sb2d5IHdpdGggJ211bHRpcGF0aGQgc2hvdyB0b3BvbG9neScgYW5kIHNkYWsg
aXMKPiA+IG1pc3NpbmcuCj4gPgo+ID4gRm9sbG93aW5nIGlzIHRoZSBsb2cgbWVzc2FnZSBmcm9t
IG11bHRpcGF0aGQgZGFlbW9uLgo+ID4gSSBmb3VuZCB0aGF0Cj4gPiAxLiBhZGRpbmcgc2RhaiB3
YXMgZG9uZSBjb3JyZWN0bHkgYW5kIG1hcAo+ID4gMzYwMDE0NGYwMzMzMzdjZmMzY2E1MjIyMjAw
MTk2MDAyIGFuZCBkbS0xMSB3YXMgY3JlYXRlZAo+ID4gMi4gZGFlbW9uIHN0YXJ0ZWQgYWRkaW5n
IHNkYWsgKGFjY29yZGluZyB0byAic2RhazogYWRkIHBhdGgKPiA+IChvcGVyYXRvcikiIG1lc3Nh
Z2UpCj4gPiAzLiBzdWRkZW5seSBtYXAgZG0tMTEgd2FzIHJlbW92ZWQgYW5kIGNyZWF0ZWQKPiA+
IDQuIGFkZGluZyBzZGFrIHJldHVybmVkIG9rIGJ1dCB0aGVyZSB3YXMgbm8gInNkYWs6IHBhdGgg
YWRkZWQgdG8KPiA+IGRldm1hcCAuLiIgbWVzc2FnZS4gIEkgd2FpdGVkIHNvbWUgbWludXRlcyBi
dXQgaXQgZGlkIG5vdCBzaG93IHVwLgo+ID4gSSBndWVzcyB0aGVyZSB3b3VsZCBiZSBzb21lIGNv
cm5lciBjYXNlIGZvciBlcnJvciBoYW5kbGluZy4KPiA+IFRoZSBtdWx0aXBhdGhkIG1pZ2h0IGhh
dmUgYW4gZXJyb3IgYnV0IG5vdCByZXR1cm4gYW4gZXJyb3IuCj4gPgo+ID4KPiA+IDxsb2cgbWVz
c2FnZT4KPiA+IG11bHRpcGF0aGRbMTkyMF06IHNkYWo6IGFkZCBwYXRoIChvcGVyYXRvcikKPiA+
IG11bHRpcGF0aGRbMTkyMF06IDM2MDAxNDRmMDMzMzM3Y2ZjM2NhNTIyMjIwMDE5NjAwMjogbG9h
ZCB0YWJsZSBbMAo+ID4gMjEwNTM0NCBtdWx0aXBhdGggMSByZXRhaW5fYXR0YWNoZWRfaHdfaGFu
ZGxlciAwIDEgMSBzZXJ2aWNlLXRpbWUgMCAxCj4gPiAxIDY2OjQ4IDFdCj4gPiBtdWx0aXBhdGhk
WzE5MjBdOiAzNjAwMTQ0ZjAzMzMzN2NmYzNjYTUyMjIyMDAxOTYwMDI6IGV2ZW50IGNoZWNrZXIK
PiA+IHN0YXJ0ZWQKPiA+IG11bHRpcGF0aGRbMTkyMF06IHNkYWogWzY2OjQ4XTogcGF0aCBhZGRl
ZCB0byBkZXZtYXAKPiA+IDM2MDAxNDRmMDMzMzM3Y2ZjM2NhNTIyMjIwMDE5NjAwMgo+ID4gbXVs
dGlwYXRoZFsxOTIwXTogc2RhazogYWRkIHBhdGggKG9wZXJhdG9yKQo+ID4gbXVsdGlwYXRoZFsx
OTIwXTogZG0tMTE6IHJlbW92ZSBtYXAgKHVldmVudCkKPiA+IG11bHRpcGF0aGRbMTkyMF06IDM2
MDAxNDRmMDMzMzM3Y2ZjM2NhNTIyMjIwMDE5NjAwMjogc3RvcCBldmVudAo+ID4gY2hlY2tlciB0
aHJlYWQgKDEzOTk3NjE3NzQ1Njg5NikKPiA+IG11bHRpcGF0aGRbMTkyMF06IGRtLTExOiByZW1v
dmUgbWFwICh1ZXZlbnQpCj4gPiBtdWx0aXBhdGhkWzE5MjBdOiAzNjAwMTQ0ZjAzMzMzN2NmYzNj
YTUyMjIyMDAxOTYwMDI6IGFkZGluZyBtYXAKPiA+IG11bHRpcGF0aGRbMTkyMF06IDM2MDAxNDRm
MDMzMzM3Y2ZjM2NhNTIyMjIwMDE5NjAwMjogZXZlbnQgY2hlY2tlcgo+ID4gc3RhcnRlZAo+ID4g
bXVsdGlwYXRoZFsxOTIwXTogMzYwMDE0NGYwMzMzMzdjZmMzY2E1MjIyMjAwMTk2MDAyOiBkZXZt
YXAgZG0tMTEKPiA+IHJlZ2lzdGVyZWQKPiA+Cj4gPiA8bXVsdGlwYXRoZCBzaG93IHRvcG9sb2d5
Pgo+ID4gMzYwMDE0NGYwMzMzMzdjZmMzY2E1MjIyMjAwMTk2MDAyIGRtLTExIFNDU1RfQklPLGUy
MWY2ZjYwNWMxZGZmZjcKPiA+IHNpemU9MS4wRyBmZWF0dXJlcz0nMSByZXRhaW5fYXR0YWNoZWRf
aHdfaGFuZGxlcicgaHdoYW5kbGVyPScwJyB3cD1ybwo+ID4gYC0rLSBwb2xpY3k9J3NlcnZpY2Ut
dGltZSAwJyBwcmlvPTEgc3RhdHVzPWVuYWJsZWQKPiA+IGAtIDc6MDowOjQ4OSBzZGFqIDY2OjQ4
ICBhY3RpdmUgcmVhZHkgcnVubmluZwo+ID4KPgo+IFRoZXNlIGxvZ3MgaW5kaWNhdGUgdGhhdCBt
dWx0aXBhdGhkIGFjdHVhbGx5IHN1Y2Nlc3NmdWxseSBhZGRlZCBzZGFrIHRvCj4gdGhlIG1hcCwg
c28gdGhlIHN1Y2Nlc3MgcmV0dXJuIHN0YXR1cyB3YXMgY29ycmVjdC4gVGhlIGxvZ3MgcHJvdmlk
ZSBubwo+IGNsdWUgd2h5IHRoZSBtYXAgd2FzIHJlbW92ZWQgYW5kIHJlLWFkZGVkLiBtdWx0aXBh
dGhkIHNlZW1zIHRvIGhhdmUgaGFkCj4ganVzdCBhIHBhc3NpdmUgcm9sZSBoZXJlLiBXZSB3b3Vs
ZCBuZWVkIHRoZSBrZXJuZWwgYW5kIHVkZXYgbG9ncwo+ICh1ZGV2LmxvZy1wcmlvcml0eT1kZWJ1
ZykgdG8gc2VlIHdoYXQncyBhY3R1YWxseSBnb2luZyBvbi4gQWxzbywgcGxlYXNlCj4gcHJvdmlk
ZSB5b3VyIG11bHRpcGF0aCBjb25maWd1cmF0aW9uIGFuZCB0aGUgdmVyc2lvbiBvZiBtdWx0aXBh
dGgtdG9vbHMKPiB5b3UncmUgdXNpbmcsIGFuZCBsb2dzIGV4dGVuZGluZyBvdmVyIGEgbG9uZyBw
ZXJpb2Qgb2YgdGltZSAoYXQgbGVhc3QKPiBjb3ZlcmluZyB0aGUgYWRkaXRpb24gb2YgdGhlIG5l
dyBwYXRocykuCk9rLCBJIHdpbGwgcnVuIHRlc3RzIGFnYWluIGFuZCBzZW5kIHlvdSBsb2dzIGxh
dGVyLgpJIGFtIHVzaW5nIDAuNi40IGZvciBEZWJpYW4gc3RyZXRjaC4KCj4KPiBJJ2QgZXhwZWN0
IG5ldyBwYXRocyB0byBiZSBhZGRlZCB0byBtYXBzIGF1dG9tYXRpY2FsbHksIGJ1dCB0aGF0Cj4g
ZG9lc24ndCBzZWVtIHRvIGhhcHBlbiBpbiB5b3VyIGNvbmZpZ3VyYXRpb24uIEFyZSB5b3UgdXNp
bmcKPiAiZmluZF9tdWx0aXBhdGhzPXN0cmljdCI/IEluIHRoYXQgY2FzZSwgeW91IHNob3VsZCBy
YXRoZXIgdXNlCj4gIm11bHRpcGF0aGQgYWRkIG1hcCAiJHd3aWQiLCBvciwgZXZlbiBiZXR0ZXIg
Im11bHRpcGF0aCAtYSAkV1dJRCIuCj4KPiBSZWdhcmRzCj4gTWFydGluCj4KPgoKT25lIHF1ZXN0
aW9uLgpJcyBpdCBwb3NzaWJsZSBmb3IgbXVsdGlwYXRoZCB0byBnZW5lcmF0ZSBhbiBldmVudCBm
b3IgcmVtb3ZpbmcgYSBtYXA/CkkgYW0gbG9va2luZyBpbnRvIHRoZSBzb3VyY2UgY29kZSwgZXZf
YWRkX3BhdGggYW5kIHNvbWUgZnVuY3Rpb25zCnJlbGF0ZWQgdG8gYWRkIGEgcGF0aCwKYnV0IGl0
IGxvb2tzIGxpa2UgaXQgZG9lcyBub3QgZ2VuZXJhdGUgYW55IGV2ZW50LgoKVGhhbmsgeW91IGFn
YWluIGZvciB5b3VyIHJlcGx5LgoKLS0gCkdpb2ggS2ltCgpDbG91ZCBzZXJ2ZXIga2VybmVsIG1h
aW50YWluZXIKUXVhbGl0eSBNYW5hZ2VtZW50IChJT05PUyBDbG91ZCkKCjEmMSBJT05PUyBTRSB8
IEdyZWlmc3dhbGRlciBTdHIuIDIwNyB8IDEwNDA1IEJlcmxpbiB8IEdlcm1hbnkKUGhvbmU6ICs0
OSAxNzYgMjY5Nzg5NjIKRS1tYWlsOiBnaS1vaC5raW1AY2xvdWQuaW9ub3MuY29tIHwgV2ViOiB3
d3cuaW9ub3MuZGUKCkhhdXB0c2l0eiBNb250YWJhdXIsIEFtdHNnZXJpY2h0IE1vbnRhYmF1ciwg
SFJCIDI0NDk4CgpWb3JzdGFuZDogRHIuIENocmlzdGlhbiBCw7ZpbmcsIEjDvHNleWluIERvZ2Fu
LCBEci4gTWFydGluIEVuZHJlw58sCkhhbnMtSGVubmluZyBLZXR0bGVyLCBBcnRodXIgTWFpLCBN
YXR0aGlhcyBTdGVpbmJlcmcsIEFjaGltIFdlacOfCkF1ZnNpY2h0c3JhdHN2b3JzaXR6ZW5kZXI6
IE1hcmt1cyBLYWRlbGtlCgpNZW1iZXIgb2YgVW5pdGVkIEludGVybmV0CgpEaWVzZSBFLU1haWwg
a2FubiB2ZXJ0cmF1bGljaGUgdW5kL29kZXIgZ2VzZXR6bGljaCBnZXNjaMO8dHp0ZQpJbmZvcm1h
dGlvbmVuIGVudGhhbHRlbi4gV2VubiBTaWUgbmljaHQgZGVyIGJlc3RpbW11bmdzZ2Vtw6TDn2Ug
QWRyZXNzYXQKc2luZCBvZGVyIGRpZXNlIEUtTWFpbCBpcnJ0w7xtbGljaCBlcmhhbHRlbiBoYWJl
biwgdW50ZXJyaWNodGVuIFNpZQpiaXR0ZSBkZW4gQWJzZW5kZXIgdW5kIHZlcm5pY2h0ZW4gU2ll
IGRpZXNlIEUtTWFpbC4gQW5kZXJlbiBhbHMgZGVtCmJlc3RpbW11bmdzZ2Vtw6TDn2VuIEFkcmVz
c2F0ZW4gaXN0IHVudGVyc2FndCwgZGllc2UgRS1NYWlsIHp1CnNwZWljaGVybiwgd2VpdGVyenVs
ZWl0ZW4gb2RlciBpaHJlbiBJbmhhbHQgYXVmIHdlbGNoZSBXZWlzZSBhdWNoCmltbWVyIHp1IHZl
cndlbmRlbi4KClRoaXMgZS1tYWlsIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBhbmQvb3IgcHJp
dmlsZWdlZCBpbmZvcm1hdGlvbi4gSWYKeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVu
dCBvZiB0aGlzIGUtbWFpbCwgeW91IGFyZSBoZXJlYnkKbm90aWZpZWQgdGhhdCBzYXZpbmcsIGRp
c3RyaWJ1dGlvbiBvciB1c2Ugb2YgdGhlIGNvbnRlbnQgb2YgdGhpcwplLW1haWwgaW4gYW55IHdh
eSBpcyBwcm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbgplcnJv
ciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgdGhlIGUtbWFpbC4KCgotLQpk
bS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRo
YXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

