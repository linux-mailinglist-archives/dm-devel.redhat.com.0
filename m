Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAB1C4731
	for <lists+dm-devel@lfdr.de>; Wed,  2 Oct 2019 07:50:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA9E3A44AC0;
	Wed,  2 Oct 2019 05:50:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 919211001B13;
	Wed,  2 Oct 2019 05:50:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E9374A486;
	Wed,  2 Oct 2019 05:50:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x925noij012566 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Oct 2019 01:49:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8698C60C80; Wed,  2 Oct 2019 05:49:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BC2060BE0;
	Wed,  2 Oct 2019 05:49:48 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B830308FEC1;
	Wed,  2 Oct 2019 05:49:47 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id y135so4070940wmc.1;
	Tue, 01 Oct 2019 22:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=CqLJuaZESvmwkvt7GiXUZR3SxF2eHzZGyE6N7E5aNpo=;
	b=nZizKZ9wUCEtBNgDbLSjtMaeeStiaLBTcT2SndX99Fe4jARdgSrjXJqTkqAIUTJJDE
	WHWbBHvEAnoFuS71yE0po67IEeKIl10pnG54JMF5g5X8LrTZwDXLQs4JO+ooiI+mGjAa
	VEZwFaH+z47rj+pvXPutwIpInvHomy2lUOBeeLLJr6zzCl8RBQFc7kbOmJ6AxFdgadtB
	zaod4Cf2pRdozJPMX/GwbeG2N6k1mgHNZHAQ8RuvaWOCNRHMxXk9QT/CRx1oXf9lAUBz
	1Bp+HqGfPNmgHpTtHGp7Gzey3WEGN81wHP/uTRulPXKYA90RSxPfm5LWvIt/+K5vO1J9
	cThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=CqLJuaZESvmwkvt7GiXUZR3SxF2eHzZGyE6N7E5aNpo=;
	b=L98S8z4DzAn8+iIPGwDkiHSWXgGFKdcu+3QTvIhr/ktdtM0atQBhxLPyvR9r/n/ga/
	I6bb+O5jPU8KccxyVOMlIvGbt+ygWcCEy9lLE4xhylC6mikYH31aCvlWlXhHVjI2WxVy
	+yDYappsOmd7+ICGo3z+TlixdJfO0HuKD0I9QFzkgs3Sj6DxoLEyblqYYpwK6n2P3AJO
	G/hP0TTRAiLEHursuYei1X1GzC9knrL9vllhfSxClvVAxbZipLmBcYbbzfqfuthlx2IL
	NBHIXLLZk4TKCfazhhuNqyeqpSXBoUTLI4b5mg8qMwvpbw76yMAHvExM8zdxVMDirAS1
	6StA==
X-Gm-Message-State: APjAAAWo/VA6WCUtgb23X/NJTbg8OxM2Kioq46/0i0GhGNenafcXrUDo
	o9uyPdO8JUd6gjHvX/h9Uho=
X-Google-Smtp-Source: APXvYqxV8Srelmvr32GIj0ONR7RAiagBAoCS/52cLglSpr30nBNX6W3uSMr2ccLtpxihlRFoLp8jPA==
X-Received: by 2002:a7b:c182:: with SMTP id y2mr1268630wmi.156.1569995386169; 
	Tue, 01 Oct 2019 22:49:46 -0700 (PDT)
Received: from x230 ([62.201.25.198])
	by smtp.gmail.com with ESMTPSA id h17sm8948086wme.6.2019.10.01.22.49.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 01 Oct 2019 22:49:45 -0700 (PDT)
Date: Wed, 2 Oct 2019 07:49:43 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Message-ID: <20191002054942.GA3544@x230>
References: <CABr-Gncq_wj6iv7knLFLU-oEMBXtP2oPfOjUFUNMMRC6Q_F12g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABr-Gncq_wj6iv7knLFLU-oEMBXtP2oPfOjUFUNMMRC6Q_F12g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 02 Oct 2019 05:49:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Wed, 02 Oct 2019 05:49:47 +0000 (UTC) for IP:'209.85.128.46'
	DOMAIN:'mail-wm1-f46.google.com' HELO:'mail-wm1-f46.google.com'
	FROM:'petr.vorel@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.46 mail-wm1-f46.google.com 209.85.128.46
	mail-wm1-f46.google.com <petr.vorel@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Chongyun Wu <wu.chongyun@h3c.com>,
	device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: Re: [dm-devel] [multipath-tools] merges
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: Petr Vorel <petr.vorel@gmail.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]); Wed, 02 Oct 2019 05:50:24 +0000 (UTC)

Hi Christophe,

> Petr, do you intent to submit a v2 of the s/daddr_t/__kernel_daddr_t/ patch
> posted jul 08, following Christoph H's comment ... or is the posted version
> fit for inclusion ?
I see you already merged it as
129e6fe6 ("kpartx: Use __kernel_daddr_t for solaris_x86_slice.s_start").
So I'll reply to the original thread.

> Thanks,
> Christophe

Kind regards,
Petr

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
