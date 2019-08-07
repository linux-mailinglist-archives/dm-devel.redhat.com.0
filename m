Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4E585098
	for <lists+dm-devel@lfdr.de>; Wed,  7 Aug 2019 18:06:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1C16C308213F;
	Wed,  7 Aug 2019 16:06:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9803C5D9CD;
	Wed,  7 Aug 2019 16:06:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B17641C8A;
	Wed,  7 Aug 2019 16:06:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x77G5buu016033 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 7 Aug 2019 12:05:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 42C6960BE0; Wed,  7 Aug 2019 16:05:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3893A60BE2
	for <dm-devel@redhat.com>; Wed,  7 Aug 2019 16:05:37 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E2E930ADBA4
	for <dm-devel@redhat.com>; Wed,  7 Aug 2019 16:05:36 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 10so588109wmp.3
	for <dm-devel@redhat.com>; Wed, 07 Aug 2019 09:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=kvxGyxH2R4MguxPxMoiGF/4nbAvKcJZ+N13SSPZxhrk=;
	b=dBD4VQR4HwddR5aihOf1S3q0Fv/h7BSg2Vw7fIYmqd7QA96QGtBkt1STa64DvwzFQ2
	82HXKWYz0dFT3ezRiOBdOBMHLXTJs2NkpIF3/zRZheae2nX2g4TAFXNp5dg/MODP0BK7
	Hfz+/+ImAOXsNWEYyLoYKcPQjJZI6ldbakt0OM7EySlxzCGtxM13NVnqoHHDAR3jnhCj
	R6zBq02QF/Pxk03Z0Yvta4wI0+WS1p15OXf2OnGQbhy4+n80/ato4XSlwBA5opVjWcjc
	fTuy3WvwkeEwiPv9EUDIdUBSRLLRIEY2pGMu+z/VdexwoirpQ25oJ1pFTd9B+fe0srZ/
	JVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=kvxGyxH2R4MguxPxMoiGF/4nbAvKcJZ+N13SSPZxhrk=;
	b=Ye4nTxc7KvsSQhaCNB7g9XWsigFiuQ677tNlb6AeuBI/OF6pzzUwGZN9pR2OZMrR5c
	sTDGlxi4OLEM2goqHvgPCl76Y3L6wEowUjzDy+pGC6wYTtFm1eW8P41G05P8rgYMLEVq
	bw9y97l4+UOvfMDaJ49s20ZVhUA6qWYfKWQJrlWnFiqXttj5Ci9pySDJ2ALDIIz9sdWs
	Wfqko+gmL5fbOIoL6hXKvGinEbRL6OfzOYJUFRPFOz4j5wYPjScw2De+s2wgR7buRtA/
	DiGLU4cDlaxTOUYl6PcvqRgZpEEjlPRcqxoC3BZ9qGQw6od50I93nZFbaTMa/bkDY3pg
	s0hg==
X-Gm-Message-State: APjAAAVdlakfzCt0qPT2DbE0T8QZauAJ830FN3Fvu8PYJPnfX+u9joQL
	U+6ikxR0EsiXsSV6q+bE2UnSuTg=
X-Google-Smtp-Source: APXvYqxtqI6f3P9lSbPbinbbmdh71tNiPhH7vHQVVrTXMVqbY+2hG8WDmI9nlpMA9vX3ab5U9fBXWw==
X-Received: by 2002:a1c:6882:: with SMTP id d124mr663180wmc.40.1565193934678; 
	Wed, 07 Aug 2019 09:05:34 -0700 (PDT)
Received: from localhost (118.red-88-12-24.staticip.rima-tde.net.
	[88.12.24.118])
	by smtp.gmail.com with ESMTPSA id y7sm617460wmm.19.2019.08.07.09.05.34
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Aug 2019 09:05:34 -0700 (PDT)
To: Brian Bunker <brian@purestorage.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>,
	linux-scsi <linux-scsi@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>
References: <EF473529-CF81-4AE9-BD96-08624B59BA10@purestorage.com>
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
Message-ID: <ef113ecf-e564-a959-870e-b80af8fe5a30@gmail.com>
Date: Wed, 7 Aug 2019 18:05:32 +0200
MIME-Version: 1.0
In-Reply-To: <EF473529-CF81-4AE9-BD96-08624B59BA10@purestorage.com>
Content-Language: en-GB
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Wed, 07 Aug 2019 16:05:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Wed, 07 Aug 2019 16:05:36 +0000 (UTC) for IP:'209.85.128.67'
	DOMAIN:'mail-wm1-f67.google.com' HELO:'mail-wm1-f67.google.com'
	FROM:'xose.vazquez@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.67 mail-wm1-f67.google.com 209.85.128.67
	mail-wm1-f67.google.com <xose.vazquez@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] ALUA support for PURE FlashArray
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Wed, 07 Aug 2019 16:06:07 +0000 (UTC)

T24gNi8yNi8xOSA3OjM3IFBNLCBCcmlhbiBCdW5rZXIgd3JvdGU6Cgo+IEl0IGhhcyBiZWVuIHNv
bWUgdGltZSBzaW5jZSB3ZSB1cGRhdGVkIG91ciBQVVJFIEZsYXNoQXJyYXkgY29uZmlndXJhdGlv
bi4gVGhlCj4gTGludXggdmVuZG9ycyB0aGF0IHdlIGhhZCBiZWVuIHNlZWluZyBpbiB0aGUgZmll
bGQgd2VyZSB1c2luZyB2ZXJ5IG9sZCB2ZXJzaW9ucwo+IG9mIG11bHRpcGF0aC10b29scywgc28g
d2UgaGF2ZW7igJl0IG5lZWRlZCB0byBjaGFuZ2UgYW55dGhpbmcgZm9yIHNvbWUgdGltZS4gV2l0
aAo+IHRoZSByZWxlYXNlIG9mIFJIRUw4LCBzb21lIG9mIG91ciBlYXJsaWVyIHZhbHVlcyBoYXZl
IGJlZW4gbG9zdCBieSB1cHN0cmVhbQo+IGNoYW5nZXMuIAo+IAo+IEluIGFkZGl0aW9uIHdlIGhh
dmUgb3VyIEFjdGl2ZSBDbHVzdGVyIGZlYXR1cmUgd2hpY2ggbGV2ZXJhZ2VzIEFMVUEgc2luY2Ug
b3VyCj4gbGFzdCBwYXRjaC4gVGhlIEFMVUEgY29uZmd1cmF0aW9uIHdpbGwgd29yayBmb3IgYWxs
IEZsYXNoQXJyYXlzIHdpdGggb3Igd2l0aG91dAo+IEFjdGl2ZSBDbHVzdGVyLgo+IAo+IFdlIGFy
ZSBjaGFuZ2luZyAzIHRoaW5ncy4KPiAKPiAxLiBBTFVBIHN1cHBvcnQKPgo+IDIuIEZhc3QgZmFp
bCB0aW1lb3V0IGZyb20gdGhlIGRlZmF1bHQgb2YgNSBzZWNvbmRzIHRvIDEwIHNlY29uZHMgKFdl
IG5lZWQgdGhpcwo+IGZvciBvdXIgRkMgTlBJViBwb3J0IG1pZ3JhdGlvbikuCj4KPiAzLiBNYXhp
bXVtIHNlY3RvciBzaXplIG9mIDRNQi4gU29tZSBMaW51eCB2ZW5kb3JzIGRvbuKAmXQgaG9ub3Ig
dGhlIGJsb2NrIGxpbWl0cwo+IFZQRCBwYWdlIG9mIElOUVVJUlkpLgoKCiMzLCBrZXJuZWwgb3Ig
dWRldiBidWc/CgoKPiBkaWZmIC0tZ2l0IGEvbGlibXVsdGlwYXRoL2h3dGFibGUuYyBiL2xpYm11
bHRpcGF0aC9od3RhYmxlLmMKPiBpbmRleCAxZDk2NDMzMy4uMzdlOTdmNjAgMTAwNjQ0Cj4gLS0t
IGEvbGlibXVsdGlwYXRoL2h3dGFibGUuYwo+ICsrKyBiL2xpYm11bHRpcGF0aC9od3RhYmxlLmMK
PiBAQCAtMTAyNCw3ICsxMDI0LDEyIEBAIHN0YXRpYyBzdHJ1Y3QgaHdlbnRyeSBkZWZhdWx0X2h3
W10gPSB7Cj4gICAgICAgICAgICAgICAgIC8qIEZsYXNoQXJyYXkgKi8KPiAgICAgICAgICAgICAg
ICAgLnZlbmRvciAgICAgICAgPSAiUFVSRSIsCj4gICAgICAgICAgICAgICAgIC5wcm9kdWN0ICAg
ICAgID0gIkZsYXNoQXJyYXkiLAo+IC0gICAgICAgICAgICAgICAucGdwb2xpY3kgICAgICA9IE1V
TFRJQlVTLAo+ICsgICAgICAgICAgICAgICAucGdwb2xpY3kgICAgICA9IEdST1VQX0JZX1BSSU8s
Cj4gKyAgICAgICAgICAgICAgIC5wZ2ZhaWxiYWNrICAgID0gLUZBSUxCQUNLX0lNTUVESUFURSwK
PiArICAgICAgICAgICAgICAgLmh3aGFuZGxlciAgICAgPSAiMSBhbHVhIiwKPiArICAgICAgICAg
ICAgICAgLnByaW9fbmFtZSAgICAgPSBQUklPX0FMVUEsCj4gKyAgICAgICAgICAgICAgIC5mYXN0
X2lvX2ZhaWwgID0gMTAsCj4gKyAgICAgICAgICAgICAgIC5tYXhfc2VjdG9yc19rYiA9IDQwOTYs
CgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3
dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=
