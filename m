Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEBE25916
	for <lists+dm-devel@lfdr.de>; Tue, 21 May 2019 22:39:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D5203086272;
	Tue, 21 May 2019 20:39:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 716C21001E82;
	Tue, 21 May 2019 20:39:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90B9F206D2;
	Tue, 21 May 2019 20:39:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4LJ0kmB031409 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 May 2019 15:00:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0D7BC5DF4B; Tue, 21 May 2019 19:00:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1A135E7DA;
	Tue, 21 May 2019 19:00:41 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 187AF882FD;
	Tue, 21 May 2019 19:00:28 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id s17so19840704wru.3;
	Tue, 21 May 2019 12:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=yA8lmoKu5fbp6TKJMD+R4FTojscpyNZ+klKiYX0Db54=;
	b=Su319boZWugKIkcpAlfpxfuJj0/yR07CC0RQqDiSanelRwDOCkzAUUasu3ZZj2+S0i
	GpLxpUMTONRAYxvZ9z6FOhFR0WGHAuKNNvNR3aw8D06UvxplzSfc5eOUMH+EcxxTcjiE
	gVIBpV2/Xt1TvD90TVNojoFPfATV1G0SAsI4UsEaXPhxUB5nFlGtsVSAqDTQhHhX6wc6
	0zYwwHfB09AsoysAFDcW742hYOin6T+R/KGJDdsZA7zp+57UoNumZ+Tnbu+IEG/oglEr
	YrFXRCsmqEKq2++F9Q6flb+YKPzHPNObgy5Kblk0ALG6OgFMmZNbXHxgRfvPKIu7wLwq
	UHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=yA8lmoKu5fbp6TKJMD+R4FTojscpyNZ+klKiYX0Db54=;
	b=T3CZAnT6yxHoFcgyYOcR8glAP0hLrg+vR37qRzyWaeENvPdlp8DKj6MGIa4mf6oueu
	gQgGWFdT9tP38FmpIS5AegAg2mkmZEb24uCrXhwXm0D0dAdi/yShqCB013S7nbgR0WOp
	sp9b9uvMkHuCb4Pgd5iNTHM1cR/V/07PP4eSE390vMmEgcTxRDzKjrSndnXNnqQ2VRf2
	SMGlDafLYrvOf/SaEuiE1Wo+Yes29dxuMMa6+eVBVoF9n1+eg22dXZ8Q0W8zNI1MnbPf
	9LNXsi3u+f4zfpFcSMQEZxwcfhtx2hccadwAYCgcCie0Lhx1UraPprQpHeuYHqzhUOKd
	Pu9w==
X-Gm-Message-State: APjAAAVGQVxnOGptSIVz3hMqV/nmH7P6fHJIMhwzvTF6dSSfQH/TE8sh
	TcHmrTRzuN/39HMLuvp4Oow=
X-Google-Smtp-Source: APXvYqxnl9qzDKl+opfSn1q4+1QbnktOTLdIPSMLM8o2SVSRwAheyBolnqCxs3wXkdWpQ1FnWUIUZw==
X-Received: by 2002:a5d:5283:: with SMTP id c3mr12544322wrv.268.1558465226324; 
	Tue, 21 May 2019 12:00:26 -0700 (PDT)
Received: from glet ([91.187.202.82]) by smtp.gmail.com with ESMTPSA id
	h14sm21055273wrt.11.2019.05.21.12.00.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 May 2019 12:00:25 -0700 (PDT)
Date: Tue, 21 May 2019 21:00:23 +0200
From: Andrea Gelmini <andrea.gelmini@linux.it>
To: Michael =?iso-8859-1?B?TGHf?= <bevan@bi-co.net>
Message-ID: <20190521190023.GA68070@glet>
References: <297da4cbe20235080205719805b08810@bi-co.net>
	<CAJCQCtR-uo9fgs66pBMEoYX_xAye=O-L8kiMwyAdFjPS5T4+CA@mail.gmail.com>
	<8C31D41C-9608-4A65-B543-8ABCC0B907A0@bi-co.net>
	<CAJCQCtTZWXUgUDh8vn0BFeEbAdKToDSVYYw4Q0bt0rECQr9nxQ@mail.gmail.com>
	<AD966642-1043-468D-BABF-8FC9AF514D36@bi-co.net>
	<158a3491-e4d2-d905-7f58-11a15bddcd70@gmx.com>
	<C1CD4646-E75D-4AAF-9CD6-B3AC32495FD3@bi-co.net>
	<3142764D-5944-4004-BC57-C89C89AC9ED9@bi-co.net>
	<F170BB63-D9D7-4D08-9097-3C18815BE869@bi-co.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F170BB63-D9D7-4D08-9097-3C18815BE869@bi-co.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 21 May 2019 19:00:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Tue, 21 May 2019 19:00:28 +0000 (UTC) for IP:'209.85.221.49'
	DOMAIN:'mail-wr1-f49.google.com' HELO:'mail-wr1-f49.google.com'
	FROM:'andrea.gelmini@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.008  (DKIM_SIGNED, DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	SPF_PASS) 209.85.221.49 mail-wr1-f49.google.com 209.85.221.49
	mail-wr1-f49.google.com <andrea.gelmini@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 21 May 2019 16:38:42 -0400
Cc: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	Chris Murphy <lists@colorremedies.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Tue, 21 May 2019 20:39:50 +0000 (UTC)

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMDY6NDY6MjBQTSArMDIwMCwgTWljaGFlbCBMYcOfIHdy
b3RlOgo+ID4gSSBmaW5pc2hlZCBiaXNlY3RpbmcuIEhlcmXigJlzIHRoZSByZXNwb25zaWJsZSBj
b21taXQ6Cj4gPiAKPiA+IGNvbW1pdCA2MTY5N2E2YWJkMjRhY2JhOTQxMzU5YzYyNjhhOTRmNGFm
ZTRhNTNkCj4gPiBBdXRob3I6IE1pa2UgU25pdHplciA8c25pdHplckByZWRoYXQuY29tPgo+ID4g
RGF0ZTogICBGcmkgSmFuIDE4IDE0OjE5OjI2IDIwMTkgLTA1MDAKPiA+IAo+ID4gICAgZG06IGVs
aW1pbmF0ZSAnc3BsaXRfZGlzY2FyZF9iaW9zJyBmbGFnIGZyb20gRE0gdGFyZ2V0IGludGVyZmFj
ZQo+ID4gCj4gPiAgICBUaGVyZSBpcyBubyBuZWVkIHRvIGhhdmUgRE0gY29yZSBzcGxpdCBkaXNj
YXJkcyBvbiBiZWhhbGYgb2YgYSBETSB0YXJnZXQKPiA+ICAgIG5vdyB0aGF0IGJsa19xdWV1ZV9z
cGxpdCgpIGhhbmRsZXMgc3BsaXR0aW5nIGRpc2NhcmRzIGJhc2VkIG9uIHRoZQo+ID4gICAgcXVl
dWVfbGltaXRzLiAgQSBETSB0YXJnZXQganVzdCBuZWVkcyB0byBzZXQgbWF4X2Rpc2NhcmRfc2Vj
dG9ycywKPiA+ICAgIGRpc2NhcmRfZ3JhbnVsYXJpdHksIGV0YywgaW4gcXVldWVfbGltaXRzLgo+
ID4gCj4gPiAgICBTaWduZWQtb2ZmLWJ5OiBNaWtlIFNuaXR6ZXIgPHNuaXR6ZXJAcmVkaGF0LmNv
bT4KPiAKPiBSZXZlcnRpbmcgdGhhdCBjb21taXQgc29sdmVzIHRoZSBpc3N1ZSBmb3IgbWUgb24g
TGludXggNS4xLjMuIFdvdWxkIHRoYXQgYmUgYW4gb3B0aW9uIHVudGlsIHRoZSByb290IGNhdXNl
IGhhcyBiZWVuIGlkZW50aWZpZWQ/IEnigJlkIHJhdGhlciBub3QgbGV0IG1vcmUgcGVvcGxlIHJ1
biBpbnRvIHRoaXMgaXNzdWUuCgpUaGFua3MgYSBsb3QgTWljaGFlbCwgZm9yIHlvdXIgdGltZS93
b3JrLgoKVGhpcyBraW5kIG9mIGJpc2VjdGluZyBhcmUgdmVyeSBib3JpbmcgYW5kIHRpbWUgY29u
c3VtaW5nLgoKSSBDQzogYWxzbyB0aGUgcGF0Y2ggYXV0aG9yLgoKVGhhbmtzIGFnYWluLApBbmRy
ZWEKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8v
d3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==
