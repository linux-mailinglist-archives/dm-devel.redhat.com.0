Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A0C7B51F
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jul 2019 23:39:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4BB185365;
	Tue, 30 Jul 2019 21:38:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB23060BF7;
	Tue, 30 Jul 2019 21:38:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2B50941F53;
	Tue, 30 Jul 2019 21:38:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6ULcdgI021911 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jul 2019 17:38:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 48F1960C4C; Tue, 30 Jul 2019 21:38:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 442F760C44
	for <dm-devel@redhat.com>; Tue, 30 Jul 2019 21:38:37 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 10E383082E91
	for <dm-devel@redhat.com>; Tue, 30 Jul 2019 21:38:36 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id e189so48920142oib.11
	for <dm-devel@redhat.com>; Tue, 30 Jul 2019 14:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+5JOOn7SBmn+BXEukedT9HDXQ6WS/r4bECASKDsfPTc=;
	b=wPargsCx1nCKwYgN+UmNJ+Ig2yIDukdOFYcafHAoe3HixxhzXwRMveW8WJbYjiLDVB
	XbzprVIA35u37LGeX54iP4ILaKrn2ZhsHJ7HWatfCu+Dy3AK04gYp0qsDNO5JINxbU66
	793vBLMC/2q9GjCzIncgSDaS52sZ95bS4q3yUIBVFG0BqK7kBkiiL0rUkTy1gy785b/G
	HixoGYJN0KZsmAs7IKt+3EffEecPzG3ht9NV6iRwONmKHhzWMdcK5ojktOyBien+IE2z
	ZnpdPMHhrkvdWxeuLBaHFjco1kw0VqWIzURD3Kv3X0Zi1Xvi85u1GhDy0eXKzpdjXw/K
	RMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+5JOOn7SBmn+BXEukedT9HDXQ6WS/r4bECASKDsfPTc=;
	b=o35fsOry8cPwQGt02Kq08b0y46+PR56XwBEKZ99jwAWIO3AqHHKxvGvmWRFp00mfRX
	nVA135fUnCHlOhkXFwBquV/84j8lxXfJx+/JPC+dytAgTAF3PfhoXfRB4rq4OGB6RNnd
	hORwIPOJ3cuN2pYa5yOFP6DdCvjNiOMBexBhUgJX8d9SmmBS6Y/7bZBBog786THbGCbt
	RtPJooPJtG5lJPykDU+VwzqRWSmZfdtVQlC8o2k8MByyLAdpL6/AzjN2Y/vfARinaoMo
	1BykTbt7l+tfVifydn2kQSefMnMZbgPsexdt971QSNf18ZeHlh2WRLRcSYAqxDVp2pIz
	ZpsA==
X-Gm-Message-State: APjAAAXfIDVGPP6ysbdTsRddZzeahWBSzZjfpUO4qv/wDjk68qfRWa3+
	wUhUkOlUSEC4VU7aRRcKs287WwGBNl2v0retUBPSeg==
X-Google-Smtp-Source: APXvYqz/vebOGKyx5iJtOjMRLpWnJO3JxlqPxCgJzVvyZc/nI/IYK9bwftHIvxiV8iym6ilmxvWFcSB3C9ypYO/5uNs=
X-Received: by 2002:aca:d80a:: with SMTP id p10mr58049607oig.105.1564522715513;
	Tue, 30 Jul 2019 14:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190730113708.14660-1-pagupta@redhat.com>
	<2030283543.5419072.1564486701158.JavaMail.zimbra@redhat.com>
	<20190730190737.GA14873@redhat.com>
In-Reply-To: <20190730190737.GA14873@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 30 Jul 2019 14:38:24 -0700
Message-ID: <CAPcyv4i10K3QdSwa3EF9t8pS-QrB9YcBEMy49N1PnYQzCkBJCw@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 30 Jul 2019 21:38:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Tue, 30 Jul 2019 21:38:36 +0000 (UTC) for IP:'209.85.167.195'
	DOMAIN:'mail-oi1-f195.google.com'
	HELO:'mail-oi1-f195.google.com' FROM:'dan.j.williams@intel.com'
	RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.167.195 mail-oi1-f195.google.com 209.85.167.195
	mail-oi1-f195.google.com <dan.j.williams@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Pankaj Gupta <pagupta@redhat.com>, jencce.kernel@gmail.com,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm: fix dax_dev NULL dereference
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 30 Jul 2019 21:39:01 +0000 (UTC)

On Tue, Jul 30, 2019 at 12:07 PM Mike Snitzer <snitzer@redhat.com> wrote:
>
> I staged the fix (which I tweaked) here:
> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.3&id=95b9ebb78c4c733f8912a195fbd0bc19960e726e

Thanks for picking this up Mike, but I'd prefer to just teach
dax_synchronous() to return false if the passed in dax_dev is NULL.
Thoughts?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
