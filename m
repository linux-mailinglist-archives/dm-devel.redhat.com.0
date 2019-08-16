Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B338FD96
	for <lists+dm-devel@lfdr.de>; Fri, 16 Aug 2019 10:19:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 671CC81DE0;
	Fri, 16 Aug 2019 08:19:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C550727C41;
	Fri, 16 Aug 2019 08:19:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A4DB72551C;
	Fri, 16 Aug 2019 08:19:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7G8IsiO016652 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Aug 2019 04:18:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E8F045D9DC; Fri, 16 Aug 2019 08:18:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E41B05DD64
	for <dm-devel@redhat.com>; Fri, 16 Aug 2019 08:18:52 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 980D53084031
	for <dm-devel@redhat.com>; Fri, 16 Aug 2019 08:18:51 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q12so702257wrj.12
	for <dm-devel@redhat.com>; Fri, 16 Aug 2019 01:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZcH6rMZvfV+AWG20Wz62KwN247zGorzKSm/4I04o3LQ=;
	b=cCd14CNN5mMt9CV6CF8mCUtajynKfYi7A+J1JpHrouYzbBelRZ60UWEeinu8qlzukB
	m1TCcsjifzBHRbiotjwN/6An3iBWNetR/jDBVZeJW8HW+DxTZ7qzzwcJYcaUKWx+PdXA
	ABttoTzZlnWM4MPyQbZiOyX6RapIUtJMwgiC+Kvs0e0m9iTFaQKQ3gUdMaLp7HuoyPUy
	2DREkn+90+ZBbCUN4F2pgwssQlIVThUDn6J9D0YCwymwk5nWsNV6okwyw/mN1jSJeBc/
	cQr23j6de0yJ0xDOobXv3o8/FhAXkeCX1viFXO4NNPIwR5BkxIRLdXtVcaaBKCd+mR7l
	R1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZcH6rMZvfV+AWG20Wz62KwN247zGorzKSm/4I04o3LQ=;
	b=PUw1yT5+6sGTw0vtbQBA93wupPxWol8Ay/iqudYWOy+cU7xyngyIisOYuhT1sSEpYE
	s0+wxIx/VSRUFTf1wP0/9VeKOHnwXOoO/v8lxI92lrS1nc16x9vh+CnZsrLBY2TVq3aS
	mlk7eXma84rFZMhsE1u1d4DIPBYU5zXvuHvqCOanciNVfgNaRK+52++6OvZP1gMArj33
	Tyxni3F8lqcZXNcxIz2tG6/9+XgRY7qRh5ge7KPvKuHad8GA5b5QX0EMjJ6eGtEtKsrj
	L8bFwsHodO9fNcD3GmAlj4fqvQSXE+QzImIJbSSxIIQ9AKeG4ChZ10hEd/G1tlHIHjfU
	CQgA==
X-Gm-Message-State: APjAAAVioRWFbrp5G45s9tMcDubzTptMFjCj9p5cRvxDJyDEtOjo7vZD
	BIqGQilm+Mw1MDfcbRBCqVPpScwFxnrlvCYQJgkbwg==
X-Google-Smtp-Source: APXvYqxeQeZx1iVRlwBZ8rNxXcZKYFGi5/bmoO7bFdHlbPQMPwBFag3R4qGLhble1xA9sPq1K5et96602Yk8vSTI+Nw=
X-Received: by 2002:adf:9222:: with SMTP id 31mr7891179wrj.93.1565943530202;
	Fri, 16 Aug 2019 01:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190815192858.28125-1-ard.biesheuvel@linaro.org>
	<1463bca3-77dc-42be-7624-e8eaf5cfbf32@gmail.com>
In-Reply-To: <1463bca3-77dc-42be-7624-e8eaf5cfbf32@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Fri, 16 Aug 2019 11:18:42 +0300
Message-ID: <CAKv+Gu9CtMMAjtjfR=uuB-+x0Lhy8gnme2HhExckW+eVZ8B_Ow@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 16 Aug 2019 08:18:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Fri, 16 Aug 2019 08:18:51 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.363  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH v12 0/4] crypto: switch to crypto API for
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Fri, 16 Aug 2019 08:19:10 +0000 (UTC)

On Fri, 16 Aug 2019 at 10:29, Milan Broz <gmazyland@gmail.com> wrote:
>
> Hi Ard,
>
> On 15/08/2019 21:28, Ard Biesheuvel wrote:
> > Changes since v10:
> > - Drop patches against fscrypt and dm-crypt - these will be routed via the
> >   respective maintainer trees during the next cycle
>
> I tested the previous dm-crypt patches (I also try to keep them in my kernel.org tree),
> it works and looks fine to me (and I like the final cleanup :)
>
> Once all maintainers are happy with the current state, I think it should go to
> the next release (5.4; IMO both ESSIV API and dm-crypt changes).
> Maybe you could keep sending dm-crypt patches in the end of the series (to help testing it)?
>

OK. But we'll need to coordinate a bit so that the first patch (the
one that introduces the template) is available in both branches,
otherwise ESSIV will be broken in the dm branch until it hits another
branch (-next or mainline) that also contains cryptodev.

As I suggested before, I can easily create a branch based on v5.3-rc1
containing just the first ESSIV patch (once Herbert is happy with it),
and merge that both into cryptodev and dm. That way, both will
continue to work without having too much overlap. Since adding a
template/file that has no users yet is highly unlikely to break
anything, it doesn't even matter which branch gets pulled first.

Any idea about the status of the EBOIV patch?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
