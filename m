Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9BE291EE
	for <lists+dm-devel@lfdr.de>; Fri, 24 May 2019 09:41:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8BE6C64123;
	Fri, 24 May 2019 07:40:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87E091750C;
	Fri, 24 May 2019 07:39:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F31081833003;
	Fri, 24 May 2019 07:38:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4NEaQZL029178 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 May 2019 10:36:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D4EA62E042; Thu, 23 May 2019 14:36:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE5B32E043
	for <dm-devel@redhat.com>; Thu, 23 May 2019 14:36:24 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 107907FDFD
	for <dm-devel@redhat.com>; Thu, 23 May 2019 14:36:16 +0000 (UTC)
Received: from mail-qk1-f198.google.com ([209.85.222.198])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1hTomd-0004cJ-QT
	for dm-devel@redhat.com; Thu, 23 May 2019 14:33:27 +0000
Received: by mail-qk1-f198.google.com with SMTP id b79so5611729qkc.0
	for <dm-devel@redhat.com>; Thu, 23 May 2019 07:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+W0ZBRDPuAaLAeSp2LgbinBlDum/QNL/K+lovUbkcD4=;
	b=ZepMNJ6reDrefVNSoQt+eXqpSOGpKJ2HOa8NPrCvORYLhHoXSFvmGAVxSm/5o3uz5G
	EBJidDBx4QQLl65gSOcnSzCdR0nUk0xC8DecHRCg0fS0HJk+yQ/sQw5RhUcuo3d9b2WN
	uKoI3aAr9TioBMtAuiqZll8aaVtOJogniFUFqYuInwBGqk+m9Cl079f7UJ77EwRD2+Hk
	4p69f2dGFUjEYn/QBy4jIB676ct6S3MEXuEwjNVpwYoJY2s/a6vcrc//89fQiyVPMS1L
	Mf92wrBlH1WzqAcN5geQ5+RX8znwlSMBLosgz/aKpqCwuihh29PACpOejPGobcAiVSMc
	OREQ==
X-Gm-Message-State: APjAAAVxhs1qtYzCml628OZk1lnP4LzbaDLHzfEapq3YIS2AnE6cleWB
	nTDHSqexQvHVkk/GVLWk4W11CBXLRDSzQXRXvgK4m1Zu2NceNl+mrI0yWQ+/RnnAVKTYm7+uTbz
	MGgLFxNYBgd2HtTPnYbwU9oRxDULlEQ==
X-Received: by 2002:a05:620a:158d:: with SMTP id
	d13mr16893971qkk.271.1558622007012; 
	Thu, 23 May 2019 07:33:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz4fx9yFrXtTha0kc9WnfvL/SpBlMkzsC3W/wxnbxEkRyUOM5BUYVF5f7rIG11P0f6vMljE7g==
X-Received: by 2002:a05:620a:158d:: with SMTP id
	d13mr16893950qkk.271.1558622006798; 
	Thu, 23 May 2019 07:33:26 -0700 (PDT)
Received: from [192.168.1.205] (189-47-79-212.dsl.telesp.net.br.
	[189.47.79.212]) by smtp.gmail.com with ESMTPSA id
	m8sm17911949qta.10.2019.05.23.07.33.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 07:33:26 -0700 (PDT)
To: Song Liu <liu.song.a23@gmail.com>
References: <20190520220911.25192-1-gpiccoli@canonical.com>
	<CAPhsuW6KayaNR-0eFHpvPG-LVuPFL_1OFjvZpOcnapVFe2vC9Q@mail.gmail.com>
From: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Message-ID: <3e583b2d-742a-3238-69ed-7a2e6cce417b@canonical.com>
Date: Thu, 23 May 2019 11:33:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAPhsuW6KayaNR-0eFHpvPG-LVuPFL_1OFjvZpOcnapVFe2vC9Q@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.27]); Thu, 23 May 2019 14:36:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Thu, 23 May 2019 14:36:16 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 24 May 2019 03:36:06 -0400
Cc: axboe@kernel.dk, linux-raid <linux-raid@vger.kernel.org>,
	Bart Van Assche <bvanassche@acm.org>, hch@infradead.org,
	"Guilherme G. Piccoli" <kernel@gpiccoli.net>,
	stable@vger.kernel.org, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Eric Ren <renzhengeek@gmail.com>,
	Jay Vosburgh <jay.vosburgh@canonical.com>,
	Gavin Guo <gavin.guo@canonical.com>
Subject: Re: [dm-devel] [PATCH V2 1/2] block: Fix a NULL pointer dereference
 in generic_make_request()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Fri, 24 May 2019 07:41:53 +0000 (UTC)

On 21/05/2019 02:59, Song Liu wrote:
> 
> Applied both patches! Thanks for the fix!

Hi Song, sorry for the annoyance, but the situation of both patches is a
bit confused for me heheh

You mention you've applied both patches - I couldn't find your tree.
Also, Christoph noticed Ming's series fixes both issues and suggested to
drop both my patches in favor of Ming's clean-up, or at least make them
-stable only.

So, what is the current status of the patches? Can we have them on
-stable trees at least? If so, how should I proceed?

Thanks in advance for the clarification!
Cheers,


Guilherme

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
