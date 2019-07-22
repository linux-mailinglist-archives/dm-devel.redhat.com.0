Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 160AA715B7
	for <lists+dm-devel@lfdr.de>; Tue, 23 Jul 2019 12:10:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B01F3091761;
	Tue, 23 Jul 2019 10:10:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDCC55D9DE;
	Tue, 23 Jul 2019 10:10:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D6D4541F53;
	Tue, 23 Jul 2019 10:10:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6MLVcqk026227 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 22 Jul 2019 17:31:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4E0E060BF3; Mon, 22 Jul 2019 21:31:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2956860BF1;
	Mon, 22 Jul 2019 21:31:33 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0599D30860C1;
	Mon, 22 Jul 2019 21:31:32 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id r6so29633840qkc.0;
	Mon, 22 Jul 2019 14:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=bkMB9iLdWFSQkbPy5t3JV4F68RV6jUdrJD2bOwvoIn8=;
	b=iWMC3L/LEDt/vVKsPAdSv09UkpyAiOkpNWdyKMDQ4qn5+thSgKDnX58gIlCo4DoNxi
	C3lWKOEbiXHIBK8nK3usgWV8PbRWDhyRVFstWCg+XzVeeo/J52lRxI61zK/lK4utFsPg
	hCarZQxcXI5I3HSxxUSkhTDdp1NQP63hAu2G+Ie6OWwqio0azTTg3kHGHoFH6RkPWLV6
	5/WEGxN/+9HdYKyjrMXdavay3PlbXFIEr9a2QyvS18wAuJHdd2XLD6T/5lG7fRhaPHkO
	TJSFtElGws2zIsFGKEmkGDCFJuU0gJOvSCdZuAM9jAAnFGvbcaPrOLDFq5+FkATx8oA0
	2X4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bkMB9iLdWFSQkbPy5t3JV4F68RV6jUdrJD2bOwvoIn8=;
	b=tehQuvXnKBlJUlwG7/G5+uIbdGhx/pD4XQ2b4fx5zJUW6JKG9KTkWYwls+xmui9aVL
	44PwZgONwZiHYTv581aY2dwj9N1a+r1ZaCv1haOGcZSu3u1JY3CfZbK8WviGfLje5PFK
	tXWKgZDLeZgdtr8YCRchBVkiZH8iEydE4sLv3cDXEq2PERFg6K41aJ6m/AbADS1UCKlQ
	sacQuMiXEtiQLO8K6j7Z16QTHZ7ukWOg81hf/36mgQ3x8XU0bSYpZfc1ZXyGGCt0eLHB
	s4HjTd/+jtPejV8XyYabF+cx2WP9T9gsVYqJ3yMk7bi4RUtydtO8UM8KeH1KY/d5bOqm
	vnwA==
X-Gm-Message-State: APjAAAU+hQiH+QvgxfAVEWANPFc7q9eEibRysCsfyKIKvXmZ9xl540Ep
	mlAn4d9fCqZct1O0GjItbPmrjLE5JWs0b/VmB98=
X-Google-Smtp-Source: APXvYqwU28I7FEeqRZ7j23Bk/5Hg6qUpt29zYyXnWc5oz7DnGYIqKvtek6EVowUlxJB6Y0AZq/4kLgLDlc2EVw1QrkE=
X-Received: by 2002:a37:4d82:: with SMTP id a124mr46359152qkb.72.1563831091271;
	Mon, 22 Jul 2019 14:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190702132918.114818-1-houtao1@huawei.com>
In-Reply-To: <20190702132918.114818-1-houtao1@huawei.com>
From: Song Liu <liu.song.a23@gmail.com>
Date: Mon, 22 Jul 2019 14:31:20 -0700
Message-ID: <CAPhsuW6yH7np1=+e5Rgutp3m1VA0TPvtANeX=0ZdpJaRKEvBkQ@mail.gmail.com>
To: Hou Tao <houtao1@huawei.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 22 Jul 2019 21:31:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Mon, 22 Jul 2019 21:31:32 +0000 (UTC) for IP:'209.85.222.194'
	DOMAIN:'mail-qk1-f194.google.com'
	HELO:'mail-qk1-f194.google.com' FROM:'liu.song.a23@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.15  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.222.194 mail-qk1-f194.google.com 209.85.222.194
	mail-qk1-f194.google.com <liu.song.a23@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6MLVcqk026227
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 23 Jul 2019 06:09:48 -0400
Cc: linux-block@vger.kernel.org, Song Liu <songliubraving@fb.com>,
	snitzer@redhat.com, NeilBrown <neilb@suse.com>,
	open list <linux-kernel@vger.kernel.org>,
	linux-raid <linux-raid@vger.kernel.org>, dm-devel@redhat.com,
	agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH 0/3] md: export internal stats through
	debugfs
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 23 Jul 2019 10:10:14 +0000 (UTC)

T24gVHVlLCBKdWwgMiwgMjAxOSBhdCA2OjI1IEFNIEhvdSBUYW8gPGhvdXRhbzFAaHVhd2VpLmNv
bT4gd3JvdGU6Cj4KPiBIaSwKPgo+IFRoZXJlIGFyZSBzbyBtYW55IGlvIGNvdW50ZXJzLCBzdGF0
cyBhbmQgZmxhZ3MgaW4gbWQsIHNvIEkgdGhpbmsKPiBleHBvcnQgdGhlc2UgaW5mbyB0byB1c2Vy
c3BhY2Ugd2lsbCBiZSBoZWxwZnVsIGZvciBvbmxpbmUtZGVidWdnaW5nLAo+IGVzcGVjaWFsbHkg
d2hlbiB0aGUgdm1saW51eCBmaWxlIGFuZCB0aGUgY3Jhc2ggdXRpbGl0eSBhcmUgbm90Cj4gYXZh
aWxhYmxlLiBBbmQgdGhlc2UgaW5mbyBjYW4gYWxzbyBiZSB1dGlsaXplZCBkdXJpbmcgY29kZQo+
IHVuZGVyc3RhbmRpbmcuCj4KPiBNRCBoYXMgYWxyZWFkeSBleHBvcnRlZCBzb21lIHN0YXRzIHRo
cm91Z2ggc3lzZnMgZmlsZXMgdW5kZXIKPiAvc3lzL2Jsb2NrL21kWC9tZCwgYnV0IHVzaW5nIHN5
c2ZzIGZpbGUgdG8gZXhwb3J0IG1vcmUgaW50ZXJuYWwKPiBzdGF0cyBhcmUgbm90IGEgZ29vZCBj
aG9pY2UsIGJlY2F1c2Ugd2UgbmVlZCB0byBjcmVhdGUgYSBzaW5nbGUKPiBzeXNmcyBmaWxlIGZv
ciBlYWNoIGludGVybmFsIHN0YXQgYWNjb3JkaW5nIHRvIHRoZSB1c2UgY29udmVudGlvbgo+IG9m
IHN5c2ZzIGFuZCB0aGVyZSBhcmUgdG9vIG1hbnkgaW50ZXJuYWwgc3RhdHMuIEZ1cnRoZXIsIHRo
ZQo+IG5ld2x5LWNyZWF0ZWQgc3lzZnMgZmlsZXMgd291bGQgYmVjb21lIEFQSXMgZm9yIHVzZXJz
cGFjZSB0b29scywKPiBidXQgdGhhdCBpcyBub3Qgd2Ugd2FudGVkLCBiZWNhdXNlIHRoZXNlIGZp
bGVzIGFyZSByZWxhdGVkIHdpdGgKPiBpbnRlcm5hbCBzdGF0cyBhbmQgaW50ZXJuYWwgc3RhdHMg
bWF5IGNoYW5nZSBmcm9tIHRpbWUgdG8gdGltZS4KPgo+IEFuZCBJIHRoaW5rIGRlYnVnZnMgaXMg
YSBiZXR0ZXIgY2hvaWNlLiBCZWNhdXNlIHdlIGNhbiBzaG93IG11bHRpcGxlCj4gcmVsYXRlZCBz
dGF0cyBpbiBhIGRlYnVnZnMgZmlsZSwgYW5kIHRoZSBkZWJ1Z2ZzIGZpbGUgd2lsbCBuZXZlciBi
ZQo+IHVzZWQgYXMgYW4gdXNlcnNwYWNlIEFQSS4KPgo+IFR3byBkZWJ1Z2ZzIGZpbGVzIGFyZSBj
cmVhdGVkIHRvIGV4cG9zZSB0aGVzZSBpbnRlcm5hbCBzdGF0czoKPiAqIGlvc3RhdDogaW8gY291
bnRlcnMgYW5kIGlvIHJlbGF0ZWQgc3RhdHMgKGUuZy4sIG1kZGV2LT5hY3RpdmVfaW8sCj4gICAg
ICAgICByMWNvbmYtPm5yX3BlbmRpbmcsIG9yIHIxY29uZmktPnJldHJ5X2xpc3QpCj4gKiBzdGF0
OiBub3JtYWwgc3RhdHMvZmxhZ3MgKGUuZy4sIG1kZGV2LT5yZWNvdmVyeSwgY29uZi0+YXJyYXlf
ZnJvemVuKQo+Cj4gQmVjYXVzZSBpbnRlcm5hbCBzdGF0cyBhcmUgc3ByZWFkZWQgYWxsIG92ZXIg
bWQtY29yZSBhbmQgbWQtcGVyc29uYWxpdHksCj4gc28gYm90aCBtZC1jb3JlIGFuZCBtZC1wZXJz
b25hbGl0eSB3aWxsIGNyZWF0ZSB0aGVzZSB0d28gZGVidWdmcyBmaWxlcwo+IHVuZGVyIGRpZmZl
cmVudCBkZWJ1Z2ZzIGRpcmVjdG9yeS4KPgo+IFBhdGNoIDEgZmFjdG9ycyBvdXQgdGhlIGRlYnVn
ZnMgZmlsZXMgY3JlYXRpb24gcm91dGluZSBmb3IgbWQtY29yZSBhbmQKPiBtZC1wZXJzb25hbGl0
eSwgcGF0Y2ggMiBjcmVhdGVzIHR3byBkZWJ1Z2ZzIGZpbGVzOiBpb3N0YXQgJiBzdGF0IHVuZGVy
Cj4gL3N5cy9rZXJuZWwvZGVidWcvYmxvY2svbWRYIGZvciBtZC1jb3JlLCBhbmQgcGF0Y2ggMyBj
cmVhdGVzIHR3byBkZWJ1Z2ZzCj4gZmlsZXM6IGlvc3RhdCAmIHN0YXQgdW5kZXIgL3N5cy9rZXJu
ZWwvZGVidWcvYmxvY2svbWRYL3JhaWQxIGZvciBtZC1yYWlkMS4KPgo+IFRoZSBmb2xsb3dpbmcg
bGluZXMgc2hvdyB0aGUgaGllcmFyY2h5IGFuZCB0aGUgY29udGVudCBvZiB0aGVzZSBkZWJ1Z2Zz
Cj4gZmlsZXMgZm9yIGEgUkFJRDEgZGV2aWNlOgo+Cj4gJCBwd2QKPiAvc3lzL2tlcm5lbC9kZWJ1
Zy9ibG9jay9tZDAKPiAkIHRyZWUKPiAuCj4g4pSc4pSA4pSAIGlvc3RhdAo+IOKUnOKUgOKUgCBy
YWlkMQo+IOKUgiAgIOKUnOKUgOKUgCBpb3N0YXQKPiDilIIgICDilJTilIDilIAgc3RhdAo+IOKU
lOKUgOKUgCBzdGF0Cj4KPiAkIGNhdCBpb3N0YXQKPiBhY3RpdmVfaW8gMAo+IHNiX3dhaXQgMCBw
ZW5kaW5nX3dyaXRlcyAwCj4gcmVjb3ZlcnlfYWN0aXZlIDAKPiBiaXRtYXAgcGVuZGluZ193cml0
ZXMgMAo+Cj4gJCBjYXQgc3RhdAo+IGZsYWdzIDB4MjAKPiBzYl9mbGFncyAweDAKPiByZWNvdmVy
eSAweDAKPgo+ICQgY2F0IHJhaWQxL2lvc3RhdAo+IHJldHJ5X2xpc3QgYWN0aXZlIDAKPiBiaW9f
ZW5kX2lvX2xpc3QgYWN0aXZlIDAKPiBwZW5kaW5nX2Jpb19saXN0IGFjdGl2ZSAwIGNudCAwCj4g
c3luY19wZW5kaW5nIDAKPiBucl9wZW5kaW5nIDAKPiBucl93YWl0aW5nIDAKPiBucl9xdWV1ZWQg
MAo+IGJhcnJpZXIgMAoKSGksCgpTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkuCgpJIHRoaW5rIHRo
ZXNlIGluZm9ybWF0aW9uIGFyZSByZWFsbHkgZGVidWcgaW5mb3JtYXRpb24gdGhhdCB3ZSBzaG91
bGQgbm90CnNob3cgaW4gL3N5cy4gT25jZSB3ZSBleHBvc2UgdGhlbSBpbiAvc3lzLCB3ZSBuZWVk
IHRvIHN1cHBvcnQgdGhlbQpiZWNhdXNlIHNvbWUgdXNlIHNwYWNlIG1heSBzdGFydCBzZWFyY2hp
bmcgZGF0YSBmcm9tIHRoZW0uCgpUaGFua3MsClNvbmcKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlz
dApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0
aW5mby9kbS1kZXZlbA==
