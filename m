Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C743258BB
	for <lists+dm-devel@lfdr.de>; Tue, 21 May 2019 22:16:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A94BE308338E;
	Tue, 21 May 2019 20:14:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05F2C600CC;
	Tue, 21 May 2019 20:14:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D1BB81833002;
	Tue, 21 May 2019 20:13:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4LKCjHD013612 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 May 2019 16:12:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 347476013D; Tue, 21 May 2019 20:12:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DC216013C
	for <dm-devel@redhat.com>; Tue, 21 May 2019 20:12:42 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D2A0308338E
	for <dm-devel@redhat.com>; Tue, 21 May 2019 20:12:30 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id z128so36866qkb.6
	for <dm-devel@redhat.com>; Tue, 21 May 2019 13:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=ahuj8dsoqzxV7jo0Q60VogkYnQLmP0dwnM5S0EqWAmI=;
	b=Es9kdpwSxoe/IZKRrHzA6BXpSxfy3uDawKBhMkbj9o99ByXj+pmX47M+ZqoOp+gEqP
	3ofmAeUCDPzHuKmiGMvMlcogxPlZhcoQ0zV8w07KAbc/lprM9tZni4heoKrAq9TPGkKW
	4SLCQ1LVMIMP0kT/qMrkn+L7m82aepTGN4rdDnSLvVu4vAhJOs9+cddaHltVIKjLhMyN
	YXHo3uOoBDyc10XGTO+xlT1mbV2WQPZ5O3iodbRo+wCwIvFn53Kh/BvXJaaJVu5X7B4o
	w4avqIKcEVTbnRuavSDNydfcS0xZBxhCFbZzbAoE9G4Mlw7e0vkoKTEVct0x+Rx9rAqG
	bwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=ahuj8dsoqzxV7jo0Q60VogkYnQLmP0dwnM5S0EqWAmI=;
	b=TEsGnzgpbl+i5Z15ifi1fNDk1gIWbEcqA/KCOtI8OUiEK/f7JivlsHK508gkWGR2NY
	jg/OmO7Rw4P5aHxEfZu8uLSZm5hkMT1NtsTO+eqv0Unu/hOrrG6utfDjvT20DIXLgZzS
	CbUt8r3BbQA6Nvxp1GNazd3sD3XcoBPSsK0f5sqtHg7l6ANNlGTNczUGeIk/+WIiR538
	mQCJD0+Kx4JIHHEZR+2eUFepGvTyU9Q+a+clFy8YjAZpg/njgFI8KKBb4+AsFbsYDw3F
	fDYYKUlJxHh/snRD4JTEL6WWuBPewiaoKUPMz32XG244IwET66KS9xh1p7KjyVTAQPTh
	Cy/Q==
X-Gm-Message-State: APjAAAXmDCTxvGjOqW0i5G00QWVYqcm3l9uptvbKNomdbTMv4ncpb48r
	4Ml/8l1abvvp9HwiQ/hPq6eJXnsGrQs=
X-Google-Smtp-Source: APXvYqybSgi+6YnTjtT/7+YhMTfR4CUDr99plsbFteUA1L7IO8fAt+x/WCGmzAB03izLz3WDWaFuOg==
X-Received: by 2002:a37:9085:: with SMTP id
	s127mr43685881qkd.352.1558469549248; 
	Tue, 21 May 2019 13:12:29 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	t2sm10642458qkd.57.2019.05.21.13.12.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 13:12:28 -0700 (PDT)
Date: Tue, 21 May 2019 16:12:27 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Andrea Gelmini <andrea.gelmini@linux.it>
Message-ID: <20190521201226.GA23332@lobo>
References: <297da4cbe20235080205719805b08810@bi-co.net>
	<CAJCQCtR-uo9fgs66pBMEoYX_xAye=O-L8kiMwyAdFjPS5T4+CA@mail.gmail.com>
	<8C31D41C-9608-4A65-B543-8ABCC0B907A0@bi-co.net>
	<CAJCQCtTZWXUgUDh8vn0BFeEbAdKToDSVYYw4Q0bt0rECQr9nxQ@mail.gmail.com>
	<AD966642-1043-468D-BABF-8FC9AF514D36@bi-co.net>
	<158a3491-e4d2-d905-7f58-11a15bddcd70@gmx.com>
	<C1CD4646-E75D-4AAF-9CD6-B3AC32495FD3@bi-co.net>
	<3142764D-5944-4004-BC57-C89C89AC9ED9@bi-co.net>
	<F170BB63-D9D7-4D08-9097-3C18815BE869@bi-co.net>
	<20190521190023.GA68070@glet>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521190023.GA68070@glet>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 21 May 2019 20:12:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Tue, 21 May 2019 20:12:30 +0000 (UTC) for IP:'209.85.222.196'
	DOMAIN:'mail-qk1-f196.google.com'
	HELO:'mail-qk1-f196.google.com' FROM:'snitzer@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.32  (DKIM_SIGNED, DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2) 209.85.222.196 mail-qk1-f196.google.com
	209.85.222.196 mail-qk1-f196.google.com <snitzer@gmail.com>
X-RedHat-Possible-Forgery: <snitzer@gmail.com> Mike Snitzer
	<snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Chris Murphy <lists@colorremedies.com>, dm-devel@redhat.com,
	Michael =?iso-8859-1?B?TGHf?= <bevan@bi-co.net>,
	Btrfs BTRFS <linux-btrfs@vger.kernel.org>,
	Qu Wenruo <quwenruo.btrfs@gmx.com>
Subject: Re: [dm-devel] fstrim discarding too many or wrong blocks on Linux
 5.1, leading to data loss
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Tue, 21 May 2019 20:15:49 +0000 (UTC)

T24gVHVlLCBNYXkgMjEgMjAxOSBhdCAgMzowMHBtIC0wNDAwLApBbmRyZWEgR2VsbWluaSA8YW5k
cmVhLmdlbG1pbmlAbGludXguaXQ+IHdyb3RlOgoKPiBPbiBUdWUsIE1heSAyMSwgMjAxOSBhdCAw
Njo0NjoyMFBNICswMjAwLCBNaWNoYWVsIExhw58gd3JvdGU6Cj4gPiA+IEkgZmluaXNoZWQgYmlz
ZWN0aW5nLiBIZXJl4oCZcyB0aGUgcmVzcG9uc2libGUgY29tbWl0Ogo+ID4gPiAKPiA+ID4gY29t
bWl0IDYxNjk3YTZhYmQyNGFjYmE5NDEzNTljNjI2OGE5NGY0YWZlNGE1M2QKPiA+ID4gQXV0aG9y
OiBNaWtlIFNuaXR6ZXIgPHNuaXR6ZXJAcmVkaGF0LmNvbT4KPiA+ID4gRGF0ZTogICBGcmkgSmFu
IDE4IDE0OjE5OjI2IDIwMTkgLTA1MDAKPiA+ID4gCj4gPiA+ICAgIGRtOiBlbGltaW5hdGUgJ3Nw
bGl0X2Rpc2NhcmRfYmlvcycgZmxhZyBmcm9tIERNIHRhcmdldCBpbnRlcmZhY2UKPiA+ID4gCj4g
PiA+ICAgIFRoZXJlIGlzIG5vIG5lZWQgdG8gaGF2ZSBETSBjb3JlIHNwbGl0IGRpc2NhcmRzIG9u
IGJlaGFsZiBvZiBhIERNIHRhcmdldAo+ID4gPiAgICBub3cgdGhhdCBibGtfcXVldWVfc3BsaXQo
KSBoYW5kbGVzIHNwbGl0dGluZyBkaXNjYXJkcyBiYXNlZCBvbiB0aGUKPiA+ID4gICAgcXVldWVf
bGltaXRzLiAgQSBETSB0YXJnZXQganVzdCBuZWVkcyB0byBzZXQgbWF4X2Rpc2NhcmRfc2VjdG9y
cywKPiA+ID4gICAgZGlzY2FyZF9ncmFudWxhcml0eSwgZXRjLCBpbiBxdWV1ZV9saW1pdHMuCj4g
PiA+IAo+ID4gPiAgICBTaWduZWQtb2ZmLWJ5OiBNaWtlIFNuaXR6ZXIgPHNuaXR6ZXJAcmVkaGF0
LmNvbT4KPiA+IAo+ID4gUmV2ZXJ0aW5nIHRoYXQgY29tbWl0IHNvbHZlcyB0aGUgaXNzdWUgZm9y
IG1lIG9uIExpbnV4IDUuMS4zLiBXb3VsZAo+IHRoYXQgYmUgYW4gb3B0aW9uIHVudGlsIHRoZSBy
b290IGNhdXNlIGhhcyBiZWVuIGlkZW50aWZpZWQ/IEnigJlkIHJhdGhlcgo+IG5vdCBsZXQgbW9y
ZSBwZW9wbGUgcnVuIGludG8gdGhpcyBpc3N1ZS4KPiAKPiBUaGFua3MgYSBsb3QgTWljaGFlbCwg
Zm9yIHlvdXIgdGltZS93b3JrLgo+IAo+IFRoaXMga2luZCBvZiBiaXNlY3RpbmcgYXJlIHZlcnkg
Ym9yaW5nIGFuZCB0aW1lIGNvbnN1bWluZy4KPiAKPiBJIENDOiBhbHNvIHRoZSBwYXRjaCBhdXRo
b3IuCgpUaGFua3MgZm9yIGNjJ2luZyBtZSwgdGhpcyB0aHJlYWQgZGlkbid0IGNhdGNoIG15IGV5
ZS4KClNvcnJ5IGZvciB5b3VyIHRyb3VibGVzLiAgQ2FuIHlvdSBwbGVhc2UgdHJ5IHRoaXMgcGF0
Y2g/CgpUaGFua3MsCk1pa2UKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21kL2RtLmMgYi9kcml2ZXJz
L21kL2RtLmMKaW5kZXggMWZiMTMzM2ZlZmVjLi45OTczODVjMWNhNTQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvbWQvZG0uYworKysgYi9kcml2ZXJzL21kL2RtLmMKQEAgLTE0NjksNyArMTQ2OSw3IEBA
IHN0YXRpYyB1bnNpZ25lZCBnZXRfbnVtX3dyaXRlX3plcm9lc19iaW9zKHN0cnVjdCBkbV90YXJn
ZXQgKnRpKQogc3RhdGljIGludCBfX3NlbmRfY2hhbmdpbmdfZXh0ZW50X29ubHkoc3RydWN0IGNs
b25lX2luZm8gKmNpLCBzdHJ1Y3QgZG1fdGFyZ2V0ICp0aSwKIAkJCQkgICAgICAgdW5zaWduZWQg
bnVtX2Jpb3MpCiB7Ci0JdW5zaWduZWQgbGVuID0gY2ktPnNlY3Rvcl9jb3VudDsKKwl1bnNpZ25l
ZCBsZW47CiAKIAkvKgogCSAqIEV2ZW4gdGhvdWdoIHRoZSBkZXZpY2UgYWR2ZXJ0aXNlZCBzdXBw
b3J0IGZvciB0aGlzIHR5cGUgb2YKQEAgLTE0ODAsNiArMTQ4MCw4IEBAIHN0YXRpYyBpbnQgX19z
ZW5kX2NoYW5naW5nX2V4dGVudF9vbmx5KHN0cnVjdCBjbG9uZV9pbmZvICpjaSwgc3RydWN0IGRt
X3RhcmdldCAqCiAJaWYgKCFudW1fYmlvcykKIAkJcmV0dXJuIC1FT1BOT1RTVVBQOwogCisJbGVu
ID0gbWluKChzZWN0b3JfdCljaS0+c2VjdG9yX2NvdW50LCBtYXhfaW9fbGVuX3RhcmdldF9ib3Vu
ZGFyeShjaS0+c2VjdG9yLCB0aSkpOworCiAJX19zZW5kX2R1cGxpY2F0ZV9iaW9zKGNpLCB0aSwg
bnVtX2Jpb3MsICZsZW4pOwogCiAJY2ktPnNlY3RvciArPSBsZW47CgotLQpkbS1kZXZlbCBtYWls
aW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxt
YW4vbGlzdGluZm8vZG0tZGV2ZWw=
