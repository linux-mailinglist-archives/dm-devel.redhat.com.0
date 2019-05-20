Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEE5241D6
	for <lists+dm-devel@lfdr.de>; Mon, 20 May 2019 22:11:37 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C8D105AFD9;
	Mon, 20 May 2019 20:11:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31C4060BE2;
	Mon, 20 May 2019 20:11:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F2FF05B424;
	Mon, 20 May 2019 20:10:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4KKAFv6024467 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 May 2019 16:10:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 175F37A420; Mon, 20 May 2019 20:10:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F1572FC60;
	Mon, 20 May 2019 20:10:15 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D2078307D914;
	Mon, 20 May 2019 20:09:59 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id m4so25651706edd.8;
	Mon, 20 May 2019 13:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jxab7ODvMHz++vFPieDm9O+WBPybjPKK2WOS+xbKwvQ=;
	b=JzFQ6voby+G6sVZ/mevlhUqn0rR8MUOqQBVbXv7dzNZ44N89TAzS/YwHZQYiIze8fr
	6x41LCiDlSEHZwLQDw82OnqdOGk4t4gYp6liVjbD1o4g7Q725Zsro2JTaW377xgMjImq
	M7FV/sSswVQ1i4O0gr/5yuOBxAPM8xzqVGSuPrpI1ggT13d+Hsm+2CfOs7svw/gtglDh
	XEvmyYtTB/0SRxocOMEvohpFnClAm57lA734a27REgq/TeZJT6Mh2Ib1URPFef18Uo/O
	SEHfPpxhZCGERreGdgTWPv/fs8OfO0K/JQgaCKjaRSIUyA2D2xz6gCy/k+ZcGKwhOZh9
	3CGg==
X-Gm-Message-State: APjAAAXzR4pJAMzoQNo1oylfhyiDDcSaZcigDfM8J6i5QsaTceQ9nmek
	rZ+VMt8XVjr2Jwl8+9V8xN9bmBxN
X-Google-Smtp-Source: APXvYqzrY5y9ss0KhWTYekG/F6ZiMZwSxF+keMIG6ALXPNc32n7tAisHQ175HoyTMRf7vberPsyF1w==
X-Received: by 2002:a17:906:d51a:: with SMTP id
	ge26mr36255909ejb.16.1558382998275; 
	Mon, 20 May 2019 13:09:58 -0700 (PDT)
Received: from [192.168.1.6] (178-117-55-239.access.telenet.be.
	[178.117.55.239])
	by smtp.gmail.com with ESMTPSA id c8sm3236991ejs.87.2019.05.20.13.09.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 13:09:57 -0700 (PDT)
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>
References: <20190520163008.20642-1-mwilck@suse.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <70067e86-7f4a-ff06-d747-4f8402199a2f@acm.org>
Date: Mon, 20 May 2019 22:09:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520163008.20642-1-mwilck@suse.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 20 May 2019 20:10:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Mon, 20 May 2019 20:10:00 +0000 (UTC) for IP:'209.85.208.66'
	DOMAIN:'mail-ed1-f66.google.com' HELO:'mail-ed1-f66.google.com'
	FROM:'bart.vanassche@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.007  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.208.66 mail-ed1-f66.google.com 209.85.208.66
	mail-ed1-f66.google.com <bart.vanassche@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x4KKAFv6024467
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] multipath-tools (coverity): assert
 availability of CLOCK_MONOTONIC
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Mon, 20 May 2019 20:11:35 +0000 (UTC)

On 5/20/19 6:30 PM, Martin Wilck wrote:
> +void get_monotonic_time(struct timespec *res)
> +{
> +	struct timespec ts;
> +
> +	assert(clock_gettime(CLOCK_MONOTONIC, &ts) == 0);
> +	*res = ts;
> +}

This is an example of bad coding style because the clock_gettime() call
will be skipped if anyone would compile this code with -DNDEBUG.

Bart.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
