Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DAFE019FDC1
	for <lists+dm-devel@lfdr.de>; Mon,  6 Apr 2020 20:59:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586199587;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LKwFw20Fj3TJu8uBIx09prMBR9HTjNhOC6KVOyqGqRY=;
	b=V67dRbGaKnIdOXj8VUJOMdbDlesCoMynFW3YNfszmXNg2LSclkrMzjjCXKRJH7daHNwAwA
	8rtZp7zy1TTrJPotu+mVKFTxg7AH+IlkwVJX39rkOLMKdIyk8wuQde2n1nAPJl/aahAtAN
	Z3BAjMbHBN2KbaJ7JAOCi4/mD0Ruzzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-Sm_LIerxNkmeDNzYcgzQzQ-1; Mon, 06 Apr 2020 14:59:45 -0400
X-MC-Unique: Sm_LIerxNkmeDNzYcgzQzQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38AFC18AB2D6;
	Mon,  6 Apr 2020 18:59:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 052EA60C18;
	Mon,  6 Apr 2020 18:59:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 712D618089D6;
	Mon,  6 Apr 2020 18:59:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 036IpKhC005301 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 14:51:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 43AD6C6909; Mon,  6 Apr 2020 18:51:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 401F4D0163
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 18:51:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A1AD185A78E
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 18:51:18 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-182-u-cZv94_MP2V-KxJ440inQ-1; Mon, 06 Apr 2020 14:51:15 -0400
X-MC-Unique: u-cZv94_MP2V-KxJ440inQ-1
Received: by mail-lf1-f68.google.com with SMTP id q5so306932lfb.13
	for <dm-devel@redhat.com>; Mon, 06 Apr 2020 11:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qhtGc2NWi/8OTbqNFI47F+sBa8PMVgXlDImrvNA4WeI=;
	b=hF4z2TleDDOIMSgbc+Yr6Zd3CHoCNocsBR2ZaGlfY9XVyXwMcqftb+v9FJR/J68H+5
	/I77lZSee74jktw5kPUT1rgLRtu6WeFArFF4hh2KCpueJIlE75pb43osnjP2iln3exeQ
	5r+jiXMspZp7oIHkuc3FbiWu1m3rmQWMkqmqKbh/0krwJebXQrQceU8hfUePtMEADlZL
	AdE84WFMAzIx/tVvDrpVNZh+e8zCr8UUrQ6uqcBuinm/mYi7GoB/LIVHP9yTDNrTG2MH
	fpI60n3LtZ+Z4PXTsxqmvraJIhZqdEH6kPpKQeKNyfvgAaJWPspdFyS84PYUHBCo+eBP
	gxtQ==
X-Gm-Message-State: AGi0PuYdw/39ygpq08j7gaeZP+0kawqWYT9gM+vIeQV1iQiQYxJDWZvs
	u+tOBsG1u9p0Fz5Cb9J9zf38lo2OtPCR18DxpDdu5w==
X-Google-Smtp-Source: APiQypKCNJNdNFC2PRonEgYGyMcSGGcujUHyRc434pzWMUoZss+1QGGz8dv1ab/TAjDHReQ3qA2uS582dsE/9/zblCs=
X-Received: by 2002:a19:c850:: with SMTP id y77mr13013340lff.45.1586199073198; 
	Mon, 06 Apr 2020 11:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200406181045.1024164-1-deven.desai@linux.microsoft.com>
In-Reply-To: <20200406181045.1024164-1-deven.desai@linux.microsoft.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 6 Apr 2020 20:50:46 +0200
Message-ID: <CAG48ez3JV-tzjRLdcys6Fz9LKYaB1h-1GaeAzkUYtY1RgxsB6g@mail.gmail.com>
To: deven.desai@linux.microsoft.com
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 036IpKhC005301
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 06 Apr 2020 14:59:16 -0400
Cc: Jens Axboe <axboe@kernel.dk>, Sasha Levin <sashal@kernel.org>,
	dm-devel@redhat.com, snitzer@redhat.com,
	Pavel Tatashin <pasha.tatashin@soleen.com>,
	James Morris <jmorris@namei.org>,
	Mimi Zohar <zohar@linux.ibm.com>, mdsakib@linux.microsoft.com,
	linux-block@vger.kernel.org, nramas@linux.microsoft.com,
	linux-security-module <linux-security-module@vger.kernel.org>,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org,
	jaskarankhurana@linux.microsoft.com, agk@redhat.com,
	"Serge E. Hallyn" <serge@hallyn.com>
Subject: Re: [dm-devel] [RESEND PATCH 00/11] Integrity Policy Enforcement
	LSM (IPE)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 6, 2020 at 8:10 PM <deven.desai@linux.microsoft.com> wrote:
> Overview:
> ------------------------------------
> IPE is a Linux Security Module, which allows for a configurable
> policy to enforce integrity requirements on the whole system. It
> attempts to solve the issue of Code Integrity: that any code being
> executed (or files being read), are identical to the version that
> was built by a trusted source.

Where's patch 02/11? lore at
https://lore.kernel.org/linux-security-module/20200406183619.GA77626@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net/T/#t
has everything other than that patch.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

