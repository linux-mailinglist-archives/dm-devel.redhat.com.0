Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1574130A30
	for <lists+dm-devel@lfdr.de>; Fri, 31 May 2019 10:24:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 226AF308A9BE;
	Fri, 31 May 2019 08:23:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FCC019736;
	Fri, 31 May 2019 08:23:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0269419725;
	Fri, 31 May 2019 08:23:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4V0iNx2022295 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 30 May 2019 20:44:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 69D562B7EA; Fri, 31 May 2019 00:44:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3787C87BC;
	Fri, 31 May 2019 00:44:19 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B8EFC3082E23;
	Fri, 31 May 2019 00:44:18 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id w7so3242683plz.1;
	Thu, 30 May 2019 17:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=pjwii2Brt6xBSvnEhlUw9zNfgBaud+bUpP81y7elYvE=;
	b=gTxizZXBja6W+65pLwkqK5NdinqbCGNOQ2cqLq+phnhxipCCbStvCBzm8gTVxhMJl4
	gb4hdeabjxPG35YWiwUM8KCuwL7WlXGBWiRVHCJ7K+/0fgiiUniJ50zU2aJwkwkN2WxZ
	Yh2kRldOVf7uxz+T3PVPsw9rD+3QidYAQX6/xdgelQyq5i7vpLJXY78Pp0ND8zvwZLo+
	QlrERKMK8lhlHnP638GJ3XiCA1vJ8EElrYSlalAu38L5p/IoNa8rdcexn7OfUT3ePz89
	HUWCtH+aCYAY11LGYjnumt/4mvovZzrzqxMXSloKiMAteN0C/4I9WgxFaiPMSYhklrNJ
	/Bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=pjwii2Brt6xBSvnEhlUw9zNfgBaud+bUpP81y7elYvE=;
	b=DP4ygXoIw9JddMbSghIdRQaW8Tho/hRH9m0cfWIllCPqzoC6I59axCkeCbVqgJk11o
	SiV4JTADoy75b1N9gXm0UETDRkDItM8FtgxAjZuzyzrtab2J1u5cqgDcfYrWl9MrEtlS
	B/g98GUbaiGYSJXtUEw5E6nMIxGpeSjylf77k3vm/ZrsLcS4ca4lZ4Q2E0ZTTDU5YWQx
	92TSOkQgE66iqfK8PeA9+pdcmrWkqMEqwGb9b2rw37DC7Q9dlKzfbI+GCIHVPeVU9XXx
	QFr41AZ8BOXAtOV/7zPNkf1tXUlMXmAtcUhLmLu1Nan5Yc7wrwYsMrXMH13p+gZs7lQV
	Z9rQ==
X-Gm-Message-State: APjAAAUqEYU28DJdPa9FEA8nBCjxxInJKNataKe3I3eyZUNrFld2Z6ZF
	AZSas6bhDXkKz0mStXpnyVxQsGJJ
X-Google-Smtp-Source: APXvYqylgEoZaxBsuYfrywx4mBS5rVGmwnIH23UDrqpIkPpDOhikd9YwQuznSYdzCo5BNwB7tyz9FQ==
X-Received: by 2002:a17:902:2d:: with SMTP id 42mr6330841pla.34.1559263458100; 
	Thu, 30 May 2019 17:44:18 -0700 (PDT)
Received: from zhanggen-UX430UQ ([66.42.35.75])
	by smtp.gmail.com with ESMTPSA id d9sm3460684pgj.34.2019.05.30.17.44.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 17:44:17 -0700 (PDT)
Date: Fri, 31 May 2019 08:44:05 +0800
From: Gen Zhang <blackgod016574@gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20190531004405.GA3090@zhanggen-UX430UQ>
References: <20190529013320.GA3307@zhanggen-UX430UQ>
	<fcf2c3c0-e479-9e74-59d5-79cd2a0bade6@acm.org>
	<20190529152443.GA4076@zhanggen-UX430UQ>
	<20190530161103.GA30026@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190530161103.GA30026@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 31 May 2019 00:44:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Fri, 31 May 2019 00:44:18 +0000 (UTC) for IP:'209.85.214.174'
	DOMAIN:'mail-pl1-f174.google.com'
	HELO:'mail-pl1-f174.google.com' FROM:'blackgod016574@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.141  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.214.174 mail-pl1-f174.google.com 209.85.214.174
	mail-pl1-f174.google.com <blackgod016574@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 31 May 2019 04:23:29 -0400
Cc: dm-devel@redhat.com, Bart Van Assche <bvanassche@acm.org>, agk@redhat.com,
	linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] dm-init: fix 2 incorrect use of kstrndup()
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Fri, 31 May 2019 08:24:02 +0000 (UTC)

> Yes, it should have the tags Bart suggested.
> 
> I'll take care it.
> 
> Thanks,
> Mike
Thanks for your reply, and please keep me informed if it is applied.

Thanks
Gen

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
