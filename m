Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB5F4C83E
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jun 2019 09:22:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3DC5A3003E61;
	Thu, 20 Jun 2019 07:22:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C4155D72E;
	Thu, 20 Jun 2019 07:22:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 07C0D206D6;
	Thu, 20 Jun 2019 07:22:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5K78RAU014103 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Jun 2019 03:08:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 568EE19C6F; Thu, 20 Jun 2019 07:08:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 515E519C4F
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 07:08:25 +0000 (UTC)
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76F7F308795D
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 07:08:10 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id m193so360703vke.10
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 00:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=benyossef-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Q/om+71JNDD3JBQpnjSSKL2z2kEsK8+9coO279bnyEo=;
	b=d3EG1zAoY9QepdPNBMwRdvli5sa3q+t7TrjivVr5U2xwpz7HSj3iy4fL6s9HAqG9F1
	mE33El0J+x8/s4A1YIwtTVOyeIxwzaV5Xk2Z70aU7qQ/euZ5WXGOwTKVjYgMd39Rtlz4
	4eeopFCQONJPvozHkt/VfLqjU8vBwvPh3rOoetwodn6PAZuHb63R+soEIqEAAU2RptnU
	c0OB3Gay14s6Xmeuyy8JTsXBxjaB1Mywz7tSskKq/AP5ISxAg/Ry6QkK7lLbjYde2AGa
	p9OEZjrHhdCdrquV5DgT1pzMA2VhlCLj0uw+ecSJkWkZT+NCcNC7n9g1wLg9duhOE/2c
	1RuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Q/om+71JNDD3JBQpnjSSKL2z2kEsK8+9coO279bnyEo=;
	b=uSLZUg6OJaylOyqdD5VCBFVj65+fkiBMUu7Cw6eiCgso7r2TfAHih0DR1IfyiLp7qb
	kRtrQXKPyeV0zf2FH+XcbkU2Mxn0eKeC0ChTuYaw2n5vPoPHFZR/0AYazx+8hsXAk7UA
	arkdE/Ps82PE255ydkcY8VjCgurbwvnAqPK9areSyHg1KGO1Pj4Osczhbyw0zp9eKFsB
	Jn08mKy8gIEi/EAn87MVd0n9v6dgX2X2hxSViUx3ZQXRzgWnkAIZ8dosXPgFU47u1v+e
	AetygNHbpIkP0BCQ+gtI/t3EdxRgRvQlXCZmU34DZuyixx5RiEwBBRTe8jLEwsF0uHgE
	OMzA==
X-Gm-Message-State: APjAAAVknqB7RErIH91Vy7yFquRZFJ5lh/egcn1zid9yf7woZaHpElx7
	9uWDH78v/aX8mOBEz5Y3DHc3MmuvCT+XmjRoWLuACQ==
X-Google-Smtp-Source: APXvYqypwyVP5mceH1L7RcgVsjBUMco5nm+IpbFYBDiFn+6Cqv/1dXa5oRNxgzHMg6Do3AUxnc61OPOl4g0CdNxFCHo=
X-Received: by 2002:a1f:8c7:: with SMTP id 190mr3978438vki.18.1561014489490;
	Thu, 20 Jun 2019 00:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
In-Reply-To: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
From: Gilad Ben-Yossef <gilad@benyossef.com>
Date: Thu, 20 Jun 2019 10:07:57 +0300
Message-ID: <CAOtvUMc0J3ufp3QyPwERdkRKfKzB_avPBoXSNWiCDS03jkNUzg@mail.gmail.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 20 Jun 2019 07:08:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Thu, 20 Jun 2019 07:08:10 +0000 (UTC) for IP:'209.85.221.194'
	DOMAIN:'mail-vk1-f194.google.com'
	HELO:'mail-vk1-f194.google.com' FROM:'gilad@benyossef.com' RCPT:''
X-RedHat-Spam-Score: -0.009  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.221.194 mail-vk1-f194.google.com 209.85.221.194
	mail-vk1-f194.google.com <gilad@benyossef.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x5K78RAU014103
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 20 Jun 2019 03:21:43 -0400
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	device-mapper development <dm-devel@redhat.com>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v3 0/6] crypto: switch to crypto API for
	ESSIV generation
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Thu, 20 Jun 2019 07:22:20 +0000 (UTC)

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgNzoyOSBQTSBBcmQgQmllc2hldXZlbAo8YXJkLmJpZXNo
ZXV2ZWxAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBUaGlzIHNlcmllcyBjcmVhdGVzIGFuIEVTU0lW
IHRlbXBsYXRlIHRoYXQgcHJvZHVjZXMgYSBza2NpcGhlciBvciBBRUFECj4gdHJhbnNmb3JtIGJh
c2VkIG9uIGEgdHVwbGUgb2YgdGhlIGZvcm0gJzxza2NpcGhlcj4sPGNpcGhlcj4sPHNoYXNoPicK
PiAob3IgJzxhZWFkPiw8Y2lwaGVyPiw8c2hhc2g+JyBmb3IgdGhlIEFFQUQgY2FzZSkuIEl0IGV4
cG9zZXMgdGhlCj4gZW5jYXBzdWxhdGVkIHN5bmMgb3IgYXN5bmMgc2tjaXBoZXIvYWVhZCBieSBw
YXNzaW5nIHRocm91Z2ggYWxsIG9wZXJhdGlvbnMsCj4gd2hpbGUgdXNpbmcgdGhlIGNpcGhlci9z
aGFzaCBwYWlyIHRvIHRyYW5zZm9ybSB0aGUgaW5wdXQgSVYgaW50byBhbiBFU1NJVgo+IG91dHB1
dCBJVi4KPgo+IFRoaXMgbWF0Y2hlcyB3aGF0IGJvdGggdXNlcnMgb2YgRVNTSVYgaW4gdGhlIGtl
cm5lbCBkbywgYW5kIHNvIGl0IGlzIHByb3Bvc2VkCj4gYXMgYSByZXBsYWNlbWVudCBmb3IgdGhv
c2UsIGluIHBhdGNoZXMgIzIgYW5kICM0Lgo+Cj4gVGhpcyBjb2RlIGhhcyBiZWVuIHRlc3RlZCB1
c2luZyB0aGUgZnNjcnlwdCB0ZXN0IHN1Z2dlc3RlZCBieSBFcmljCj4gKGdlbmVyaWMvNTQ5KSwg
YXMgd2VsbCBhcyB0aGUgbW9kZS10ZXN0IHNjcmlwdCBzdWdnZXN0ZWQgYnkgTWlsYW4gZm9yCj4g
dGhlIGRtLWNyeXB0IGNhc2UuIEkgYWxzbyB0ZXN0ZWQgdGhlIGFlYWQgY2FzZSBpbiBhIHZpcnR1
YWwgbWFjaGluZSwKPiBidXQgaXQgZGVmaW5pdGVseSBuZWVkcyBzb21lIHdpZGVyIHRlc3Rpbmcg
ZnJvbSB0aGUgZG0tY3J5cHQgZXhwZXJ0cy4KPgo+IENoYW5nZXMgc2luY2UgdjI6Cj4gLSBmaXhl
ZCBhIGNvdXBsZSBvZiBidWdzIHRoYXQgc251Y2sgaW4gYWZ0ZXIgSSdkIGRvbmUgdGhlIGJ1bGsg
b2YgbXkKPiAgIHRlc3RpbmcKPiAtIHNvbWUgY29zbWV0aWMgdHdlYWtzIHRvIHRoZSBFU1NJViB0
ZW1wbGF0ZSBza2NpcGhlciBzZXRrZXkgZnVuY3Rpb24KPiAgIHRvIGFsaWduIGl0IHdpdGggdGhl
IGFlYWQgb25lCj4gLSBhZGQgYSB0ZXN0IGNhc2UgZm9yIGVzc2l2KGNiYyhhZXMpLGFlcyxzaGEy
NTYpCj4gLSBhZGQgYW4gYWNjZWxlcmF0ZWQgaW1wbGVtZW50YXRpb24gZm9yIGFybTY0IHRoYXQg
Y29tYmluZXMgdGhlIElWCj4gICBkZXJpdmF0aW9uIGFuZCB0aGUgYWN0dWFsIGVuL2RlY3J5cHRp
b24gaW4gYSBzaW5nbGUgYXNtIHJvdXRpbmUKPgo+IFNjcm9sbCBkb3duIGZvciB0Y3J5cHQgc3Bl
ZWQgdGVzdCByZXN1bHQgY29tcGFyaW5nIHRoZSBlc3NpdiB0ZW1wbGF0ZQo+IHdpdGggdGhlIGFz
bSBpbXBsZW1lbnRhdGlvbi4gQmFyZSBjYmMoYWVzKSB0ZXN0cyBpbmNsdWRlZCBmb3IgcmVmZXJl
bmNlCj4gYXMgd2VsbC4gVGFrZW4gb24gYSAyR0h6IENvcnRleC1BNTcgKEFNRCBTZWF0dGxlKQo+
Cj4gQ29kZSBjYW4gYmUgZm91bmQgaGVyZQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2FyZGIvbGludXguZ2l0L2xvZy8/aD1lc3Npdi12MwoKClRoYW5r
IHlvdSBBcmQgZm9yIHRoaXMgd29yay4gSXQgaXMgdmVyeSB1c2VmdWwuIEkgYW0gdGVzdGluZyB0
aGlzIG5vdwp3aXRoIHRoZSBlc3NpdiBpbXBsZW1lbnRhdGlvbiBpbnNpZGUgQ3J5cHRvQ2VsbC4K
Ck9uZSBwb3NzaWJsZSBmdXR1cmUgb3B0aW1pemF0aW9uIHRoaXMgb3BlbnMgdGhlIGRvb3IgZm9y
IGlzIGhhdmluZyB0aGUKdGVtcGxhdGUgYXV0by1pbmNyZW1lbnQgdGhlIHNlY3RvciBudW1iZXIu
CgpUaGlzIHdpbGwgYWxsb3cgdGhlIGRldmljZSBtYW5hZ2VyIG9yIGZzY3J5cHQgY29kZSB0byBh
c2sgZm9yIGNyeXB0bwpzZXJ2aWNlcyBvbiBidWZmZXIgc3Bhbm5pbmcgb3ZlciBhIHNpbmdsZSBz
ZWN0b3Igc2l6ZQphbmQgaGF2ZSB0aGUgY3J5cHRvIGNvZGUgYXV0b21hdGljYWxseSBpbmNyZW1l
bnQgdGhlIHNlY3RvciBudW1iZXIKd2hlbiBwcm9jZXNzaW5nIHRoZSBidWZmZXIuCgpUaGlzIG1h
eSBwb3RlbnRpYWxseSBzaGF2ZSBhIGZldyBjeWNsZXMgYmVjYXVzZSBpdCBjYW4gcG90ZW50aWFs
bHkKdHVybiBtdWx0aXBsZSBjYWxscyBpbnRvIHRoZSBjcnlwdG8gQVBJIGluIG9uZSwgZ2l2aW5n
CnRoZSBjcnlwdG8gY29kZSBhIGxhcmdlciBidWZmZXIgdG8gd29yayBvbi4KClRoaXMgaXMgYWN0
dWFsbHkgc3VwcG9ydGVkIGJ5IENyeXB0b0NlbGwgaGFyZHdhcmUgYW5kIHRvIHRoZSBiZXN0IG9m
Cm15IGtub3dsZWRnZSBhbHNvIGJ5IGEgc2ltaWxhciBIVyBmcm9tIFF1YWxjb21tCnZpYSBvdXQt
b2YtdHJlZSBwYXRjaGVzIGZvdW5kIGluIHRoZSBBbmRyb2lkIHRyZWUuCgpJZiB0aGlzIG1ha2Vz
IHNlbnNlIHRvIHlvdSBwZXJoYXBzIGl0IGlzIGEgZ29vZCBpZGVhIHRvIGhhdmUgdGhlCnRlbXBs
YXRlIGZvcm1hdCBiZToKCjxza2NpcGhlcj4sPGNpcGhlcj4sPHNoYXNoPiwgPHNlY3RvciBzaXpl
PgoKV2hlcmUgZm9yIG5vdyB3ZSB3aWxsIG9ubHkgc3VwcG9ydCBhIHNlY3RvciBzaXplIG9mICcw
JyAoaS5lLiBkbyBub3QKYXV0by1pbmNyZW1lbnQpIGFuZCBsYXRlciBleHRlbmQgb3IgYW0gSSBv
dmVyIGVuZ2luZWVyaW5nPyA6LSkKClRoYW5rcywKR2lsYWQKCgotLSAKR2lsYWQgQmVuLVlvc3Nl
ZgpDaGllZiBDb2ZmZWUgRHJpbmtlcgoKdmFsdWVzIG9mIM6yIHdpbGwgZ2l2ZSByaXNlIHRvIGRv
bSEKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8v
d3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==
