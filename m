Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9DE85B7B
	for <lists+dm-devel@lfdr.de>; Thu,  8 Aug 2019 09:21:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 26E65315C00B;
	Thu,  8 Aug 2019 07:21:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 444825D9DC;
	Thu,  8 Aug 2019 07:21:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F22D12551C;
	Thu,  8 Aug 2019 07:21:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x76CjpIk031932 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 6 Aug 2019 08:45:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E24D0600CC; Tue,  6 Aug 2019 12:45:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B6376013A;
	Tue,  6 Aug 2019 12:45:47 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E53FE30A5A56;
	Tue,  6 Aug 2019 12:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1565095531;
	bh=En3myy3jkFERsP4r44CEwITztWYu2JZZ8iyTuvFxb74=;
	h=X-UI-Sender-Class:To:Cc:References:Subject:From:Date:In-Reply-To;
	b=KnHztrJc+of+VwlpozVhMqeU3ayf3x3BfxwyuKBZo3rkOawL/Z1UfuCtpfUcmd3Q+
	jxZHKeHBG3tCSgmCtN1xe1maJwvs7TJEdrnf2HISjJpRg/dT4BUJKStqJvs4HLvDII
	LqaI5Dxv2gIs4JEL98kN1xWCgI0s8CGI5SBFR6ZM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.79.190]) by smtp.web.de (mrweb103
	[213.165.67.124]) with ESMTPSA (Nemesis) id 0LqDYi-1iYhNj1syu-00dqU6;
	Tue, 06 Aug 2019 14:45:31 +0200
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com
References: <20190806001825.GA6854@embeddedor>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
	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
	FEE=
Message-ID: <a6b3127e-11cb-4dc8-7db8-e526521d11d9@web.de>
Date: Tue, 6 Aug 2019 14:45:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806001825.GA6854@embeddedor>
Content-Language: en-GB
X-Provags-ID: V03:K1:P8kEC5Oc6PiE1IF1//D6hq/tvexOWvxlpgL9QzgkwaiJAVHYbeC
	nAzAXFHPgxO3UzIphMjGkNgyWaC/YbIn+hOqAIBZa3GMaTjW2XamC57Pz3YK9XDQmQseB7M
	XIkgwR3siUwwDZKysClQADhtJns8p5aEwHt0qwSaGBbedBfO/l2iFOdDAHSUsJxIoh9rfX9
	hJrieyf9PETIVjuQ+XbTg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6azNcsqMCGM=:DDsmc5lMl3x6CyiCZbAiS2
	3bWUJ6OHaQTinAdJ842Fl3FuspmsMHY64asXfcqIaQ9ebUwlUwI8RBuz8QkYl0HSjAJZvFr9a
	SMWwa9aXY1R46KuX+9j/BLva86Aeq69sAvS+fo2ZXCaX/ObQtvYv4rWk2VhOaUJxwP5e6jMFW
	UoNt2zGhukgGPGDlbiHFZ2qZYllouLSJ63UBPcHBTZhjVj1KrMzyB3i7QhZY+8e2nYaGFiyuv
	nF1Tll8XFGvU1cHzyLI3gicI4mjWLGR0SZIeI6YHas727Un1A7DdgFyo37xtEPRbCuscyD7JC
	a39doD37CnRVcWpxljmfSLgUakXI9NVlZi6Gt7CmIaV9748VBW1EwDnY4In+no0toBnOnXFF1
	Em+PUE7TcrBEDM7yDozUMEJP7Phltr31x55Sk/vsq9py5G158IieYhCMzYhHCWXFoX/wGMdzV
	c8+B1eDgGRnJq8JeDs16ylIHCuTi8hbjrra+TUILWzWvBovqWxf1yhpHlPXI0Llh5Lok5LD5v
	BSbbjAzwmfy0QaJ0abDXoK2WIIRMUqEzAARzWIZxLP6tkMsNDp2TCADxSP48J7FsK2h55Ss7k
	7TUqNnLjYA1oLOTZxriSO/ZQdBFwxc8pFuICayPAX7hBU7vKsz1GrLTUtCOz1AO/P156u/woq
	DnPGlg2hKOTn17/9iCOYM82rQzv7Wt1/LvajQTtC7hvI7oND0OdmSdd4l9UfZCMpDSm99FKyT
	tWu3+czVS4zTi6nbmwKESc27FRXp0SKPQHhaSfEBdFP5rSj7e8Tt9XdM6lyovP9Fx9kgQRZh1
	8S7jIi8KNAfeVzoZtCk/WtxcNoWwaNzKGjaafrrc0Hc5Q1N+nXx4R1IdwFnz+E4ykRJnsh8YG
	INht12jGXcsvqFWWXbBWx5ubAIzUs+SY96IhCxoY+nB9o7kFIeoKStPzQDI05rpWSX+CviyQe
	CAPM6LuyJoDyUgheUslQdLcHT4nWZovF3DNXLjisYxBUaDEPzu1nWR7x+UNYQy7FqkuHdfHeo
	Z48FyFyOGwMtI84aDGJw2MshoceQwTIJmG+9GlJ2hlKCpELU/V77eKsQvIdUmoVnuB01ECeKm
	aVHN3VXpWB39Iy+o5oMv6sNs8ThhFVtfpnluWbbARU2dmrI60cZjXeM2Px2Z4VwToRtCpl0Fp
	Dd7dY=
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.47]); Tue, 06 Aug 2019 12:45:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Tue, 06 Aug 2019 12:45:46 +0000 (UTC) for IP:'212.227.17.12'
	DOMAIN:'mout.web.de' HELO:'mout.web.de'
	FROM:'Markus.Elfring@web.de' RCPT:''
X-RedHat-Spam-Score: -0.799  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 212.227.17.12 mout.web.de 212.227.17.12 mout.web.de
	<Markus.Elfring@web.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x76CjpIk031932
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 08 Aug 2019 03:21:19 -0400
Cc: Colin Ian King <colin.king@canonical.com>, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH] dm raid1: Use struct_size() in kzalloc()
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Thu, 08 Aug 2019 07:21:46 +0000 (UTC)

PiArKysgYi9kcml2ZXJzL21kL2RtLXJhaWQxLmMKPiBAQCAtODc4LDEyICs4NzgsOSBAQCBzdGF0
aWMgc3RydWN0IG1pcnJvcl9zZXQgKmFsbG9jX2NvbnRleHQodW5zaWduZWQgaW50IG5yX21pcnJv
cnMsCj4gIAkJCQkJc3RydWN0IGRtX3RhcmdldCAqdGksCj4gIAkJCQkJc3RydWN0IGRtX2RpcnR5
X2xvZyAqZGwpCj4gIHsKPiAtCXNpemVfdCBsZW47Cj4gIAlzdHJ1Y3QgbWlycm9yX3NldCAqbXMg
PSBOVUxMOwrigKYKCkhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gcmVwbGFjZSB0aGUgaW5pdGlh
bGlzYXRpb24g4oCcTlVMTOKAnSBieSB0aGUgZGVzaXJlZCBmdW5jdGlvbiBjYWxsPwoKUmVnYXJk
cywKTWFya3VzCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpo
dHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=
