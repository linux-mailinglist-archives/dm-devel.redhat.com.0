Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B8549A34
	for <lists+dm-devel@lfdr.de>; Tue, 18 Jun 2019 09:16:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0F8194627A;
	Tue, 18 Jun 2019 07:16:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 182A94D1;
	Tue, 18 Jun 2019 07:16:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C797654D3C;
	Tue, 18 Jun 2019 07:16:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5H8qFPt014522 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Jun 2019 04:52:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B89257E677; Mon, 17 Jun 2019 08:52:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B04827E670
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 08:52:13 +0000 (UTC)
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1685C31628ED
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 08:52:04 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id 34so3193012uar.8
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 01:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=benyossef-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=JUqP3OKeD9bPLmSeCNOPOKYOA3EuQZNFNBZVHYzC5g4=;
	b=XtlskwgAxUNAXyFcXU16C6KAhEpQNCyyXjj/AqlIJZIPfIDfe9DP0YJEN8hUAybdZS
	GeF4UKONeKyJ16gBgPsvAi2PpvkgnDWRV530xC5Fhd1QqHmm2yPAXv+70RA+rKE5rEBj
	9OvPRoBYneEwIjZyfG6ds0OZ8k7zGP7BsfwJJ3yCeYjfJPQC1a+hovGdIfMsNX8aeChl
	2EoDLFZy79Y8Ra7HxUSdwkf/HAQt3tsb9ll/BlDyQe1ajUGFXwuqRHfAyqy5PzculMNI
	BR8xoqtihnK7YQd9hRUtQuxdNnjLEKq5dBY7QGM/mt/Ss2hnCRiW8IALIkwW2pQDXOKr
	I9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=JUqP3OKeD9bPLmSeCNOPOKYOA3EuQZNFNBZVHYzC5g4=;
	b=HP/UoY2Wd/9gbIhQ1KED1b71c5APkCbxRzRMYI+Mw3XYTdezZn1tWgJKF8JdpkaQ8u
	aRoyfz3hlxwJOHmfeGVxIW0aKG88kBRNJfPbuB2e0IRmaaYscrqX8VVpOW97Bo4x/kqu
	VgxJc/oJH2pbiOx4vSGm065+5KozDSXNTzPl++oKzWZtq0U6Vt5x21CYbalIzHQlBIZ6
	+yHBh6pordmXodKKBihWi7ozo3Jn1IvY44JJFasQd7+Qw4inIsyvvQBwcpckDan5VXur
	3eJYgjz+v5tZefZmYHRuNfFf4muqFlxQDdy4hBMYTGnrsFvZqiecViMdC7xNZ+MGWOzR
	nDxg==
X-Gm-Message-State: APjAAAVAJxhFC3+Mu/qGLAuIk8AbaFXn+adZdLe7kynFjvtbDIsIV+ho
	M/uJcVs2ipwpQx01OAphtEFXPs5YcDHO9ntQ6ndB4Q==
X-Google-Smtp-Source: APXvYqxUsRrEeCO+S9+Ink2+fjaOAiIAOcXiVQUU81FYi7df7idYsDJ/kS+jTivSSuU+OpV27+CqsbxLSOqSeurMJ9U=
X-Received: by 2002:ab0:208c:: with SMTP id r12mr41428470uak.27.1560761523133; 
	Mon, 17 Jun 2019 01:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190614083404.20514-1-ard.biesheuvel@linaro.org>
	<20190616204419.GE923@sol.localdomain>
In-Reply-To: <20190616204419.GE923@sol.localdomain>
From: Gilad Ben-Yossef <gilad@benyossef.com>
Date: Mon, 17 Jun 2019 11:51:52 +0300
Message-ID: <CAOtvUMf86_TGYLoAHWuRW0Jz2=cXbHHJnAsZhEvy6SpSp_xgOQ@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 17 Jun 2019 08:52:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Mon, 17 Jun 2019 08:52:04 +0000 (UTC) for IP:'209.85.222.66'
	DOMAIN:'mail-ua1-f66.google.com' HELO:'mail-ua1-f66.google.com'
	FROM:'gilad@benyossef.com' RCPT:''
X-RedHat-Spam-Score: -0.008  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.222.66 mail-ua1-f66.google.com 209.85.222.66
	mail-ua1-f66.google.com <gilad@benyossef.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x5H8qFPt014522
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 18 Jun 2019 03:15:24 -0400
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fscrypt@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [dm-devel] [RFC PATCH 0/3] crypto: switch to shash for ESSIV
	generation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Tue, 18 Jun 2019 07:16:57 +0000 (UTC)

T24gU3VuLCBKdW4gMTYsIDIwMTkgYXQgMTE6NDQgUE0gRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IFsrQ2MgZG0tZGV2ZWwgYW5kIGxpbnV4LWZzY3J5cHRdCj4K
PiBPbiBGcmksIEp1biAxNCwgMjAxOSBhdCAxMDozNDowMUFNICswMjAwLCBBcmQgQmllc2hldXZl
bCB3cm90ZToKPiA+IFRoaXMgc2VyaWVzIGlzIHByZXNlbnRlZCBhcyBhbiBSRkMgZm9yIGEgY291
cGxlIG9mIHJlYXNvbnM6Cj4gPiAtIGl0IGlzIG9ubHkgYnVpbGQgdGVzdGVkCj4gPiAtIGl0IGlz
IHVuY2xlYXIgd2hldGhlciB0aGlzIGlzIHRoZSByaWdodCB3YXkgdG8gbW92ZSBhd2F5IGZyb20g
dGhlIHVzZSBvZgo+ID4gICBiYXJlIGNpcGhlcnMgaW4gbm9uLWNyeXB0byBjb2RlCj4gPiAtIHdl
IGhhdmVuJ3QgcmVhbGx5IGRpc2N1c3NlZCB3aGV0aGVyIG1vdmluZyBhd2F5IGZyb20gdGhlIHVz
ZSBvZiBiYXJlIGNpcGhlcnMKPiA+ICAgaW4gbm9uLWNyeXB0byBjb2RlIGlzIGEgZ29hbCB3ZSBh
Z3JlZSBvbgo+ID4KPiA+IFRoaXMgc2VyaWVzIGNyZWF0ZXMgYW4gRVNTSVYgc2hhc2ggdGVtcGxh
dGUgdGhhdCB0YWtlcyBhIChjaXBoZXIsaGFzaCkgdHVwbGUsCj4gPiB3aGVyZSB0aGUgZGlnZXN0
IHNpemUgb2YgdGhlIGhhc2ggbXVzdCBiZSBhIHZhbGlkIGtleSBsZW5ndGggZm9yIHRoZSBjaXBo
ZXIuCj4gPiBUaGUgc2V0a2V5KCkgb3BlcmF0aW9uIHRha2VzIHRoZSBoYXNoIG9mIHRoZSBpbnB1
dCBrZXksIGFuZCBzZXRzIGludG8gdGhlCj4gPiBjaXBoZXIgYXMgdGhlIGVuY3J5cHRpb24ga2V5
LiBEaWdlc3Qgb3BlcmF0aW9ucyBhY2NlcHQgaW5wdXQgdXAgdG8gdGhlCj4gPiBibG9jayBzaXpl
IG9mIHRoZSBjaXBoZXIsIGFuZCBwZXJmb3JtIGEgc2luZ2xlIGJsb2NrIGVuY3J5cHRpb24gb3Bl
cmF0aW9uIHRvCj4gPiBwcm9kdWNlIHRoZSBFU1NJViBvdXRwdXQuCi4uLgo+IEkgYWdyZWUgdGhh
dCBtb3ZpbmcgYXdheSBmcm9tIGJhcmUgYmxvY2sgY2lwaGVycyBpcyBnZW5lcmFsbHkgYSBnb29k
IGlkZWEuICBGb3IKPiBmc2NyeXB0IEknbSBmaW5lIHdpdGggbW92aW5nIEVTU0lWIGludG8gdGhl
IGNyeXB0byBBUEksIHRob3VnaCBJJ20gbm90IHN1cmUgYQo+IHNoYXNoIHRlbXBsYXRlIGlzIHRo
ZSBiZXN0IGFwcHJvYWNoLiAgRGlkIHlvdSBhbHNvIGNvbnNpZGVyIG1ha2luZyBpdCBhIHNrY2lw
aGVyCj4gdGVtcGxhdGUgc28gdGhhdCB1c2VycyBjYW4gZG8gZS5nLiAiZXNzaXYoY2JjKGFlcyks
c2hhMjU2LGFlcykiPyAgVGhhdCB3b3VsZAo+IHNpbXBsaWZ5IHRoaW5ncyBtdWNoIG1vcmUgb24g
dGhlIGZzY3J5cHQgc2lkZSwgc2luY2UgdGhlbiBhbGwgdGhlIEVTU0lWLXJlbGF0ZWQKPiBjb2Rl
IHdvdWxkIGdvIGF3YXkgZW50aXJlbHkgZXhjZXB0IGZvciBjaGFuZ2luZyB0aGUgc3RyaW5nICJj
YmMoYWVzKSIgdG8KPiAiZXNzaXYoY2JjKGFlcyksc2hhMjU2LGFlcykiLgoKSSB3aWxsIGFsc28g
YWRkIHRoYXQgZ29pbmcgdGhlIHNrY2lwaGVyIHJvdXRlIHJhdGhlciB0aGFuIHNoYXNoIHdpbGwK
YWxsb3cgaGFyZHdhcmUgdGZtIHByb3ZpZGVycyBsaWtlIENyeXB0b0NlbGwgdGhhdCBjYW4gZG8g
dGhlIEVTU0lWCnBhcnQgaW4gaGFyZHdhcmUgaW1wbGVtZW50IHRoYXQgYXMgYSBzaW5nbGUgQVBJ
IGNhbGwgYW5kL29yIGhhcmR3YXJlCmludm9jYXRpb24gZmxvdy4KRm9yIHRob3NlIHN5c3RlbSB0
aGF0IGJlbmVmaXQgZnJvbSBoYXJkd2FyZSBwcm92aWRlcnMgdGhpcyBjYW4gYmUgYmVuZWZpY2lh
bC4KClRoYW5rcywKR2lsYWQKCi0tIApHaWxhZCBCZW4tWW9zc2VmCkNoaWVmIENvZmZlZSBEcmlu
a2VyCgp2YWx1ZXMgb2YgzrIgd2lsbCBnaXZlIHJpc2UgdG8gZG9tIQoKLS0KZG0tZGV2ZWwgbWFp
bGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2RtLWRldmVs
