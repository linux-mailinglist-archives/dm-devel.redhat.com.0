Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 525F21B9873
	for <lists+dm-devel@lfdr.de>; Mon, 27 Apr 2020 09:24:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587972255;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5yBDGUTQ3YqelQKih9rUIH0GrRpwHy25Nmcgx65v/WY=;
	b=g1TixH4/vep92nksbb4kJ+0eRUS/I/jLCJ0zOvfcMjAi2QtGGfqbrKHCXniwF044qfRmRp
	1516yB9pBvhAw0BZvzuBVh3XTDw6gaGeUf8YWTtQGRhDkfMKI90kuHlFnlYZdCwnTq+UQn
	1cE080DFPM0D4PPKwiJ7fwZlWuwSzUM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-cwTgNc9oN8W2sAcVkeSKSQ-1; Mon, 27 Apr 2020 03:24:13 -0400
X-MC-Unique: cwTgNc9oN8W2sAcVkeSKSQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B129D872FEC;
	Mon, 27 Apr 2020 07:24:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5658460C84;
	Mon, 27 Apr 2020 07:24:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 04FA41809542;
	Mon, 27 Apr 2020 07:23:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03ODJJQ3001197 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 Apr 2020 09:19:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4E64010BC290; Fri, 24 Apr 2020 13:19:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 466B310BC296
	for <dm-devel@redhat.com>; Fri, 24 Apr 2020 13:19:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AFD61859160
	for <dm-devel@redhat.com>; Fri, 24 Apr 2020 13:19:17 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
	[209.85.210.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-407-2fKIPDDNMV-gaFKn0Whj-Q-1; Fri, 24 Apr 2020 09:19:14 -0400
X-MC-Unique: 2fKIPDDNMV-gaFKn0Whj-Q-1
Received: by mail-ot1-f49.google.com with SMTP id i27so12251639ota.7
	for <dm-devel@redhat.com>; Fri, 24 Apr 2020 06:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=3N72kKgXmaMrqxVhGBBds9zxwDdvLvCG7uDkZwWQTQY=;
	b=e9wErMeCskIjYlLoS7c2jlXqwmQlWpnstY3QZ/ryjt78D/nNqcpFsGIciUxqZ3ulDT
	Nqlvge6/m94HgbJXiST2wlVH1EvuIZ/gjXYE49Rqc43iU8zuz0v4kH4BsHugYZVrg/qZ
	Gro8VpiRul7PpqXqcsOpeJlbOHbu3UB4L3QlQ+CKRd+m+NOxnGa6XcEOS2gT5TqgRoAw
	j4SIStI91Gv6T746d6Y9llWB6cAvThDNvbAICLmf2y9buhL4UXAFojzSjiqNnwOIy0yw
	KOCl6ZaHOT8DBaR+OX3YNHPLMXZHuvZJc2tN8csugajuFdGYmOW8l/0bfXBW0AAMkZL1
	bNrQ==
X-Gm-Message-State: AGi0PuZErp59J1iIHwGjDkZFwy7zDKElzHJRO6YJ7Xzja/dSShvg5ghs
	emCyW1piaeKzjCxOAL2ds11aaxyIXwU4cP0LMFxSMg==
X-Google-Smtp-Source: APiQypKXAd9sS6bh00twx+XFFUpL73lzK/AijoonfOPGVeWl8/OZwFHdQozk5TLgmKirqAwNBP1lRhWhNG+rozZl8Wo=
X-Received: by 2002:aca:d06:: with SMTP id 6mr6513403oin.78.1587734353426;
	Fri, 24 Apr 2020 06:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAJX1YtZiGXdZTrGtw8ksP3khRf26jQ7dhBWoEJcGfQQZMGb-gg@mail.gmail.com>
	<086d3e2baae71658539ac7caf634336ea0927c04.camel@suse.com>
	<CAJX1YtaKhjLNN56rvwAXh7tOP1Egbo1izmFn3OUEhD4c489E1w@mail.gmail.com>
	<3dbafeb000d558af21db70816130573106b56a9c.camel@suse.com>
	<CAJX1YtYw+aJ5xXjZKoksF9gh3aaJoQRiqAkjUigc5R0-bFPb1w@mail.gmail.com>
	<afac68664b44a28203325fed2fee7d8c0d9ae750.camel@suse.com>
In-Reply-To: <afac68664b44a28203325fed2fee7d8c0d9ae750.camel@suse.com>
From: Gioh Kim <gi-oh.kim@cloud.ionos.com>
Date: Fri, 24 Apr 2020 15:18:37 +0200
Message-ID: <CAJX1YtYV9j-jmW9W9FaFcndYM2CT9xLLXTs=RW-a4SB=h1N-KQ@mail.gmail.com>
To: Martin Wilck <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03ODJJQ3001197
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 27 Apr 2020 03:23:40 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgTWFydGluLAoKT24gVGh1LCBBcHIgMjMsIDIwMjAgYXQgMzo1OCBQTSBNYXJ0aW4gV2lsY2sg
PG13aWxja0BzdXNlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIDIwMjAtMDQtMjMgYXQgMTM6NTAg
KzAyMDAsIEdpb2ggS2ltIHdyb3RlOgo+ID4gSGkgTWFydGluLAo+ID4KPiA+IE9uIFdlZCwgQXBy
IDIyLCAyMDIwIGF0IDU6NDAgUE0gTWFydGluIFdpbGNrIDxtd2lsY2tAc3VzZS5jb20+IHdyb3Rl
Ogo+ID4gPiBPbiBXZWQsIDIwMjAtMDQtMjIgYXQgMTY6MDAgKzAyMDAsIEdpb2ggS2ltIHdyb3Rl
Ogo+ID4gPiA+IE9uZSBxdWVzdGlvbi4KPiA+ID4gPiBJcyBpdCBwb3NzaWJsZSBmb3IgbXVsdGlw
YXRoZCB0byBnZW5lcmF0ZSBhbiBldmVudCBmb3IgcmVtb3ZpbmcgYQo+ID4gPiA+IG1hcD8KPiA+
ID4gPiBJIGFtIGxvb2tpbmcgaW50byB0aGUgc291cmNlIGNvZGUsIGV2X2FkZF9wYXRoIGFuZCBz
b21lIGZ1bmN0aW9ucwo+ID4gPiA+IHJlbGF0ZWQgdG8gYWRkIGEgcGF0aCwKPiA+ID4gPiBidXQg
aXQgbG9va3MgbGlrZSBpdCBkb2VzIG5vdCBnZW5lcmF0ZSBhbnkgZXZlbnQuCj4gPiA+Cj4gPiA+
IEkgZ3Vlc3MgeW91IG1lYW4gYW4gdWV2ZW50LiBUaGVzZSBldmVudHMgYXJlIGNyZWF0ZWQgYnkg
dGhlIGtlcm5lbAo+ID4gPiB3aGVuCj4gPiA+IG11bHRpcGF0aCBjcmVhdGVzIG9yIHJlbG9hZHMg
bWFwcy4gbXVsdGlwYXRoZCBub3JtYWxseSBkb2Vzbid0Cj4gPiA+IHRyaWdnZXIKPiA+ID4gdGhl
IGV2ZW50cyBkaXJlY3RseS4gIEJ1dCB0aGVyZSBhcmUgc29tZSBjYXNlcyB3aGVyZSBtdWx0aXBh
dGhkCj4gPiA+IGJhc2ljYWxseSBydW5zIHRoZSBlcXVpdmFsZW50IG9mICJ1ZGV2YWRtIHRyaWdn
ZXIgLWMgY2hhbmdlIiBvbgo+ID4gPiBlaXRoZXIKPiA+ID4gbWFwcyBvciBwYXRocy4gU2VhcmNo
IHRoZSBjb2RlIGZvciAidHJpZ2dlciIgZm9yIGRldGFpbHMuCj4gPiA+Cj4gPiA+IFRoZXJlIGFy
ZSBhbHNvIGRldmljZSBtYXBwZXIgZXZlbnRzIHdoaWNoIGFyZSBjcmVhdGVkIGJ5IHRoZSBrZXJu
ZWwKPiA+ID4gZm9yCj4gPiA+IGNlcnRhaW4gc3RhdGUgY2hhbmdlcyBvZiBkbSBkZXZpY2VzLiBB
Z2FpbiwgbXVsdGlwYXRoZCBvbmx5Cj4gPiA+IHJlY2VpdmVzCj4gPiA+IHN1Y2ggZXZlbnRzLgo+
ID4gPgo+ID4gPiBSZWdhcmRzCj4gPiA+IE1hcnRpbgo+ID4gPgo+ID4gPgo+ID4gPgo+ID4KPiA+
IEkgYW0gbWFraW5nIGFuIGVudmlyb25tZW50IHRvIGNhcHR1cmUgbG9nIGZvciB1ZXZlbnQgYXMg
eW91IHNhaWQuCj4gPgo+ID4gTWVhbndoaWxlIEkgZm91bmQgc29tZXRoaW5nIHdlaXJkOiAib3Jw
aGFuIHBhdGgsIHdhaXRpbmcgZm9yIGNyZWF0ZQo+ID4gdG8KPiA+IGNvbXBsZXRlIiB3aGF0IGlz
IHRoaXMgbWVzc2FnZT8KPiA+IEkgZ3Vlc3MgdGhlIHNlY29uZCBhZGRlZCBwYXRoIHdhcyBub3Qg
cmVnaXN0ZXJlZCB3aGVuIEkgZXhlY3V0ZWQKPiA+ICJtdWx0aXBhdGhkIGFkZCBwYXRoIiBhdCB0
aGlzIG1vbWVudC4KPgo+IFRydWUuICJvcnBoYW4iIG1lYW5zIHRoYXQgeW91IGFkZGVkIGEgcGF0
aCB0aGF0IGRpZG4ndCBiZWxvbmcgdG8gYSBtYXAuCj4KPiBBZ2FpbiwgeW91ciBtdWx0aXBhdGhk
IHNlZW1zIHRvIGJlIGNvbmZpZ3VyZWQgc3VjaCB0aGF0IG1hcHMgYXJlbid0Cj4gY3JlYXRlZCBh
dXRvbWF0aWNhbGx5ICgiZmluZF9tdWx0aXBhdGhzIHN0cmljdCIpLiBJJ20gbm90IHN1cmUgd2hl
dGhlcgo+IHRoYXQgbWFrZXMgYSBsb3Qgb2Ygc2Vuc2UgaW4geW91ciBzZXR1cCwgdGhlIHdheSB5
b3UgZGVzY3JpYmUgaXQuCj4gV2l0aCAiZmluZF9tdWx0aXBhdGhzIHNtYXJ0IiBvciAiZmluZF9t
dWx0aXBhdGhzIGdyZWVkeSIsIHlvdXIgbmV3IG1hcHMKPiB3b3VsZCBiZSBhZGRlZCB3aXRob3V0
IGFkbWluIGludGVydmVudGlvbi4KClllcywgZXhhY3RseS4KSSBkaXNhYmxlZCBhbGwgYXV0b21h
dGljIHdvcmsuCkFjdHVhbGx5IGl0IGlzIGxlZ2FjeSBjb2RlLiBJIGRvIG5vdCBrbm93IHdoeS4K
QXMgbGlrZSBhbGwgb3RoZXIgbGVnYWN5IGNvZGUsIGl0IGlzIG5vdCBlYXN5IHRvIGNoYW5nZSBh
bmQgdGVzdC4KCkkgYW0gcmVhbGx5IHNvcnJ5IHRvIG5vdCBpbmZvcm0geW91IG9mIHRoZSB2ZXJz
aW9uIG9mIG11bHRpcGF0aC10b29scy4KSXQncyAwLjYuNCBmcm9tIERlYmlhbiBzdHJldGNoIHJl
cG9zaXRvcnkuCgo+Cj4gPgo+ID4gSSBndWVzcyB0aGVyZSB3b3VsZCBiZSBzb21lIHRpbWUgZGVs
YXkgZm9yIHRoZSBzZWNvbmQgcGF0aCB0byBiZQo+ID4gaW5jbHVkZWQgaW4gdGhlIHRvcG9sb2d5
Lgo+ID4gQW0gSSByaWdodD8KPiA+IElmIEkgYW0gcmlnaHQsIGNvdWxkIEkgbWFrZSAibXVsdGlw
YXRoZCBhZGQgcGF0aCIgcmV0dXJuIG9ubHkgYWZ0ZXIKPiA+IGV2ZXJ5dGhpbmcgaXMgY29tcGxl
dGVseSBmaW5pc2hlZD8KPgo+IFdoYXQgaXMgImV2ZXJ5dGhpbmciPyBob3cgd291bGQgbXVsdGlw
YXRoZCBrbm93IHRoYXQgeW91IGludGVuZCB0byBhZGQKPiBhbm90aGVyIHBhdGg/IEFzIEkgc2Fp
ZCBwcmV2aW91c2wsIHlvdSdkIHByb2JhYmx5IGJlIGJldHRlciBvZmYgdXNpbmcKPiAibXVsdGlw
YXRoIC1hICRXV0lEIiwgd2hpY2ggd291bGQgYWRkIHRoZSBuZXcgV1dJRCB0byB0aGUgV1dJRHMg
ZmlsZSwKPiB3aGljaCBjb250cm9scyBtdWx0aXBhdGhkJ3Mgb3BlcmF0aW9uIGluICJmaW5kX211
bHRpcGF0aHMgc3RyaWN0IiBtb2RlLgo+Cj4gPiBBcHIgMjMgMTE6Mzg6MjUgaWIxIG11bHRpcGF0
aGRbMjEzMl06IHNkYzogb3BlbiBub2RlOiAvZGV2L3NkYwo+ID4gQXByIDIzIDExOjM4OjI1IGli
MSBtdWx0aXBhdGhkWzIxMzJdOiBzZGM6IGRvbWFwIHdpdGggbXBwLT5hY3Rpb249Ngo+ID4gQXBy
IDIzIDExOjM4OjI1IGliMSBtdWx0aXBhdGhkWzIxMzJdOgo+ID4gMzYwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwOiBsb2FkIHRhYmxlIFswIDIwNDgwMCBtdWx0aXBhdGggMQo+Cj4gVGhp
cyBXV0lEIGxvb2tzIHZlcnkgZmlzaHkgdG8gbWUuIEVzcGVjaWFsbHkgd2hlbiB5b3UgYWRkIG9y
IHJlbW92ZQo+IHBhdGhzIGR5bmFtaWNhbGx5LCBiZSBzdXJlIHRvIHVzZSB1bmlxdWUgV1dJRHMu
CgpUaGV5IGFyZSB0ZXN0IGRldmljZXMgd2l0aCBmaXhlZCBXV0lEcy4KCj4KPiBSZWdhcmRzCj4g
TWFydGluCj4KPgoKSSB3b3VsZCBsaWtlIHRvIGluZm9ybSB5b3Ugb2Ygd2hhdCBJIGZvdW5kIG91
dC4KMS4gJ211bHRpcGF0aGQgYWRkIHBhdGggc2R4JyBpcyBleGVjdXRlZAoyLiBBZGRpbmcgdGhk
IHNkeCBhbHNvIGNyZWF0ZXMgYSBtYXAuCjMuIFRoZSBtdWx0aXBhdGhkIGRhZW1vbiB3YWl0cyBm
b3IgdGhlIGNoYW5nZSB1ZXZlbnQgZnJvbSBrZXJuZWwuCjQuIEFub3RoZXIgc2QgZGV2aWNlIHNk
eSBpcyBhZGRlZCB3aXRoICdtdWx0aXBhdGhkIGFkZCBwYXRoIHNkeScgY29tbWFuZAo1LiBhZGRp
bmcgc2R5IGlzIG5vdCBkb25lIGFuZCBtdWx0aXBhdGhkIHByaW50cyBhIG1lc3NhZ2UgInNkeTog
b3JwaGFuCnBhdGgsIHdhaXRpbmcgZm9yIGNyZWF0ZSB0byBjb21wbGV0ZSIKNi4gU29tZXRoaW5n
IChJIGd1ZXNzIGl0IGlzIHRoZSBjaGVja2VyIHRocmVhZCkgcmVtb3ZlcyBhbmQgYWRkcyB0aGUg
ZG0gZGV2aWNlCjcuIHNkeSBpcyByZW1vdmVkIHdpdGggYSBtZXNzYWdlICJzZHk6IG9ycGhhbiBw
YXRoLCBwYXRoIHJlbW92ZWQKZXh0ZXJuYWxseSIuIEkgZ3Vlc3MgdGhlIGNoZWNrZXIgdGhyZWFk
IHJlbW92ZXMgc2R5IGFzIHdlbGwuCgpJIGFtIG5vdCBzdXJlIHdoYXQgcmVtb3ZlcyB0aGUgZG0g
ZGV2aWNlIGFuZCBzZHkgZGV2aWNlLgpJIGd1ZXNzIGl0IHdvdWxkIGJlIHRoZSBjaGVjayB0aHJl
YWQgZHVlIHRvIHRoZSAic2R5OiBvcnBoYW4gcGF0aCwKcGF0aCByZW1vdmVkIGV4dGVybmFsbHki
IG1lc3NhZ2UuCgpUaGVyZWZvcmUgSSBqdXN0IGFkZGVkIHRoZSAndWRldmFkbSBzZXR0bGUnIGNv
bW1hbmQgYWZ0ZXIgdGhlCidtdWx0aXBhdGhkIGFkZCBwYXRoIHNkeCcgY29tbWFuZC4KU28gd2hl
bmV2ZXIgbXkgc2NyaXB0IGV4ZWN1dGVzICdtdWx0aXBhdGhkIGFkZCBwYXRoJywgaXQgYWxzbyBl
eGVjdXRlcwondWRldmFkbSBzZXR0bGUnLgpUaGVuIG15IHRlc3QgaXMgZmluZSBmb3IgYSBsb25n
IHRpbWUuCgoKLS0gCkdpb2ggS2ltCgpDbG91ZCBzZXJ2ZXIga2VybmVsIG1haW50YWluZXIKUXVh
bGl0eSBNYW5hZ2VtZW50IChJT05PUyBDbG91ZCkKCjEmMSBJT05PUyBTRSB8IEdyZWlmc3dhbGRl
ciBTdHIuIDIwNyB8IDEwNDA1IEJlcmxpbiB8IEdlcm1hbnkKUGhvbmU6ICs0OSAxNzYgMjY5Nzg5
NjIKRS1tYWlsOiBnaS1vaC5raW1AY2xvdWQuaW9ub3MuY29tIHwgV2ViOiB3d3cuaW9ub3MuZGUK
CkhhdXB0c2l0eiBNb250YWJhdXIsIEFtdHNnZXJpY2h0IE1vbnRhYmF1ciwgSFJCIDI0NDk4CgpW
b3JzdGFuZDogRHIuIENocmlzdGlhbiBCw7ZpbmcsIEjDvHNleWluIERvZ2FuLCBEci4gTWFydGlu
IEVuZHJlw58sCkhhbnMtSGVubmluZyBLZXR0bGVyLCBBcnRodXIgTWFpLCBNYXR0aGlhcyBTdGVp
bmJlcmcsIEFjaGltIFdlacOfCkF1ZnNpY2h0c3JhdHN2b3JzaXR6ZW5kZXI6IE1hcmt1cyBLYWRl
bGtlCgpNZW1iZXIgb2YgVW5pdGVkIEludGVybmV0CgpEaWVzZSBFLU1haWwga2FubiB2ZXJ0cmF1
bGljaGUgdW5kL29kZXIgZ2VzZXR6bGljaCBnZXNjaMO8dHp0ZQpJbmZvcm1hdGlvbmVuIGVudGhh
bHRlbi4gV2VubiBTaWUgbmljaHQgZGVyIGJlc3RpbW11bmdzZ2Vtw6TDn2UgQWRyZXNzYXQKc2lu
ZCBvZGVyIGRpZXNlIEUtTWFpbCBpcnJ0w7xtbGljaCBlcmhhbHRlbiBoYWJlbiwgdW50ZXJyaWNo
dGVuIFNpZQpiaXR0ZSBkZW4gQWJzZW5kZXIgdW5kIHZlcm5pY2h0ZW4gU2llIGRpZXNlIEUtTWFp
bC4gQW5kZXJlbiBhbHMgZGVtCmJlc3RpbW11bmdzZ2Vtw6TDn2VuIEFkcmVzc2F0ZW4gaXN0IHVu
dGVyc2FndCwgZGllc2UgRS1NYWlsIHp1CnNwZWljaGVybiwgd2VpdGVyenVsZWl0ZW4gb2RlciBp
aHJlbiBJbmhhbHQgYXVmIHdlbGNoZSBXZWlzZSBhdWNoCmltbWVyIHp1IHZlcndlbmRlbi4KClRo
aXMgZS1tYWlsIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBhbmQvb3IgcHJpdmlsZWdlZCBpbmZv
cm1hdGlvbi4gSWYKeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUt
bWFpbCwgeW91IGFyZSBoZXJlYnkKbm90aWZpZWQgdGhhdCBzYXZpbmcsIGRpc3RyaWJ1dGlvbiBv
ciB1c2Ugb2YgdGhlIGNvbnRlbnQgb2YgdGhpcwplLW1haWwgaW4gYW55IHdheSBpcyBwcm9oaWJp
dGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbgplcnJvciwgcGxlYXNlIG5v
dGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgdGhlIGUtbWFpbC4KCgotLQpkbS1kZXZlbCBtYWls
aW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxt
YW4vbGlzdGluZm8vZG0tZGV2ZWw=

