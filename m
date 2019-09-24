Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B56FBC59B
	for <lists+dm-devel@lfdr.de>; Tue, 24 Sep 2019 12:18:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B51A6A26674;
	Tue, 24 Sep 2019 10:18:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CAFD5C21F;
	Tue, 24 Sep 2019 10:18:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 513E54EBC9;
	Tue, 24 Sep 2019 10:18:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8O88DY9003429 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Sep 2019 04:08:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E277160933; Tue, 24 Sep 2019 08:08:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx25.extmail.prod.ext.phx2.redhat.com
	[10.5.110.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26B2C60852;
	Tue, 24 Sep 2019 08:08:11 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6220F10C0949;
	Tue, 24 Sep 2019 08:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1569312482;
	bh=5UUB7nBISPCMR8MLkZQo563E2CTK7plA3+JuTrsQPlU=;
	h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
	b=hEEPKBhivbXBokJZPSixHFQyrwbGDoTQfOUMwaSxHAT+mm73WXm1wk+J0XjHaBXAR
	fqrJifb6ER1xWqCtVT/c3fxnMrRIIiXiGSno3JlXkqT+FBBRJYFxvjtTrVBz1jpaTx
	m7kYHgHNuH+TBbxdB1g+/DN4wjPrT5OCjPPvB9DQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.71.162]) by smtp.web.de (mrweb003
	[213.165.67.108]) with ESMTPSA (Nemesis) id 0M6Dve-1hxcnA2BeE-00yDJX;
	Tue, 24 Sep 2019 10:08:02 +0200
To: Valentin Schneider <valentin.schneider@arm.com>,
	Alexey Dobriyan <adobriyan@gmail.com>, dm-devel@redhat.com,
	linux-block@vger.kernel.org, rcu@vger.kernel.org
References: <a43fe392-bd6a-71f5-8611-c6b764ba56c3@arm.com>
	<7e3e784c-e8e6-f9ba-490f-ec3bf956d96b@web.de>
	<0c4dcb91-4830-0013-b8c6-64b9e1ce47d4@arm.com>
	<32d65b15-1855-e7eb-e9c4-81560fab62ea@arm.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
	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
	FEE=
Message-ID: <af969579-116c-fba7-fd32-15a876ac0445@web.de>
Date: Tue, 24 Sep 2019 10:07:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <32d65b15-1855-e7eb-e9c4-81560fab62ea@arm.com>
Content-Language: en-US
X-Provags-ID: V03:K1:gdWTto7J1BLMzpuLsjXkxMpm9JPQANR6lT0+Gi8LVIYwwvcnmCB
	wbRC8Aq7YkXsjPF2BrDnR9s/c6qPEEeWSZK/1z0lz52lbZhqTmxMIlxXHOnRhiYfG5sQtoQ
	FwqPHD58FJBBWWLkgBF6+0ELov+JPZgWu/8tcNRcWkjWo+IVraNRuisxGf/B+KkFlahpWIz
	8h+zWSyzIgQs9I7ijaaeg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:axxi6oXRmys=:x4mHB2rn9HIwxjm/+2t7zx
	F1NrtiZgELzy2ru7iCxdt4NWKcGpGGjPsVpGg8+16qutpm0DWxghSB/AXMPHdJBFv332Hh1Vb
	PT7SQ7NNJ+cIwPLJ5/SCW9E9keRAkmt1EyMCNy2gN91IKJFEswwEJ0MmC7+/cfjfCFsIEp6pJ
	FLKEG3th06O4BcFH8mqUF9Mk4vWFLAyKc4IAj9KPFUt52E88JzUorbGFyke7DxbVSNwlWGRmd
	335yNlorr+YGfDVj0M7VGzOXfmdyK/rJYLlXc52IO7MSuwslC2MYJTko88PnGyQ+/+QfCyApC
	EntibQqhHBCyVM5ev/ZHr9rVu8zwj57bXWJ699bXDBgazEIswXQyyihh4mbJ4ecIVkoFl6zS/
	cmxBNk4APQ06Nkwb0sN06cnrenzVEypb4td+1BnXd/fC93T0aJEqvSdc+khMwrsfS46p3iBh1
	Dj/iHl0ASgnP7MZxzb3RukBHlJBf6p2O2kKB004Qj2B+0e1dGistXv+swgJ12UOJETuqvAm5l
	qPmCXhUb8nv7iEJcl2Q1sYYlegwEqaVo2Zp9r1fDY1TFN2OurCMZhS9mF/ifkxvL+2XjT4pkq
	jmIC43UcGojXxpC8CMkTJB5B35KhuI0zPlAI8WwIUHGGIou7SrQYfzRxpZJr5Q2rYWNd6LlS1
	wtkwa2yF+Zab/WaSEEdbyG49wgbEzyfLNSPWscRO3DxAVNSSI5NUfgsV8+gf7FvTGFV7Sa70F
	Gb9yZFcwP8MbIsaC7DRzl5OCJ1vqXTurImDFjGp95IRRCW7Qp7Vnegr0rpBQU+FJSxm8ci/U1
	AuG8PMOB6Gf6MZXYSAFURWupW33l69XI9GojX2CvRivO6UaD+tFtqRrQuVzFwFQ0Ok/zs1nuY
	ogEE5QDEKFNi+dWpAnx9GbB1/ThpKJnD7hOGMZCSTnrSYMxUkOnb98c78kYM+RuZWSt0+GgAo
	OpqtSr0JhRztyLJDymLPBkgF6xliV49tYmmc5M+Gv+favKnyfoTs4tEQlR79y/G6fSRHfMHFU
	KB1tngPzCRERXJi5gE/qlFIVq6PQdxebZZXRI+GHpuIECb8p3VI4kFiblW4qezbxEVS77nryq
	IzBd3+9e1OyF3NzrLITHCQ8g3zZCgCqD7XCvxGbTmEfHFB+aFVOnETsmB9L3rRk7kJS2spFvm
	nA1BDxjDD0G0bT53sK5dPzMc/2dAyNrR9YFqfCAKWIzVYKPGNcudBkVPMA2oBfj2TejziW80d
	hoed+CDCFa7ucCxSpJghlOwp/KfxX/t8n/+xfb924K9fDBc4oTMisWxIOUzs=
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]);
	Tue, 24 Sep 2019 08:08:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]);
	Tue, 24 Sep 2019 08:08:10 +0000 (UTC) for IP:'212.227.15.4'
	DOMAIN:'mout.web.de' HELO:'mout.web.de'
	FROM:'Markus.Elfring@web.de' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, SPF_HELO_NONE,
	SPF_PASS) 212.227.15.4 mout.web.de 212.227.15.4 mout.web.de
	<Markus.Elfring@web.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.66
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x8O88DY9003429
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 24 Sep 2019 06:18:27 -0400
Cc: Andrea Arcangeli <aarcange@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	Julia Lawall <julia.lawall@lip6.fr>, Ingo Molnar <mingo@redhat.com>
Subject: Re: [dm-devel] sched: make struct task_struct::state 32-bit
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]); Tue, 24 Sep 2019 10:18:48 +0000 (UTC)

PiAvLyBGSVhNRTogY3VycmVudCBub3QgcmVjb2duaXplZCBhcyB0YXNrX3N0cnVjdCosIGZpeGhh
Y2sgd2l0aCByZWdleHAKPiBpZGVudGlmaWVyIGN1cnJlbnQgPX4gIl5jdXJyZW50JCI7CgpXb3Vs
ZCB5b3UgcmVhbGx5IGxpa2UgdG8gdXNlIGEgcmVndWxhciBleHByZXNzaW9uIGZvciBmaW5kaW5n
IGEgc2luZ2xlIHdvcmQ/CgoKPiBpZGVudGlmaWVyIHN0YXRlX3ZhcjsKPiBwb3NpdGlvbiBwb3M7
Cj4gQEAKPgo+ICgKPiAgIHAtPnN0YXRlICYgc3RhdGVfdmFyQHBvcwo+IHwKPiAgIGN1cnJlbnQt
PnN0YXRlICYgc3RhdGVfdmFyQHBvcwo+IHwKCkkgc2VlIGZ1cnRoZXIgb3Bwb3J0dW5pdGllcyB0
byBtYWtlIHN1Y2ggYSBTbVBMIGRpc2p1bmN0aW9uIG1vcmUgc3VjY2luY3QuCgoqCiggKCBcKCBw
IFx8IGN1cnJlbnQgXCkgKSAtPiBzdGF0ZSAmIHN0YXRlX3ZhckBwb3MKfArigKYKCiogSG93IGRv
IHlvdSB0aGluayBhYm91dCB0byB3b3JrIHdpdGggYSBTbVBMIGNvbnN0cmFpbnQKICBmb3IgYSBt
ZXRhdmFyaWFibGUgd2l0aCB0aGUgdHlwZSDigJxiaW5hcnkgb3BlcmF0b3LigJ0/CgoKPiAgIHNl
dF9jdXJyZW50X3N0YXRlKHN0YXRlX3ZhckBwb3MpCj4gfAo+ICAgc2V0X3NwZWNpYWxfc3RhdGUo
c3RhdGVfdmFyQHBvcykKCnwgXCggc2V0X2N1cnJlbnRfc3RhdGUgXHwgc2V0X3NwZWNpYWxfc3Rh
dGUgXCkgKHN0YXRlX3ZhckBwb3MpCgoKPiB8Cj4gICBzaWduYWxfcGVuZGluZ19zdGF0ZShzdGF0
ZV92YXJAcG9zLCBwKQo+IHwKPiAgIHNpZ25hbF9wZW5kaW5nX3N0YXRlKHN0YXRlX3ZhckBwb3Ms
IGN1cnJlbnQpCgp8IHNpZ25hbF9wZW5kaW5nX3N0YXRlKHN0YXRlX3ZhckBwb3MsIFwoIHAgXHwg
Y3VycmVudCBcKSApCgoKUmVnYXJkcywKTWFya3VzCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGlu
Zm8vZG0tZGV2ZWw=
