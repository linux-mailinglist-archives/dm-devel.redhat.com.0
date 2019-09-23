Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EC047BB19D
	for <lists+dm-devel@lfdr.de>; Mon, 23 Sep 2019 11:47:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4FF2E8535C;
	Mon, 23 Sep 2019 09:47:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADBEF5C1B2;
	Mon, 23 Sep 2019 09:47:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 97434180085A;
	Mon, 23 Sep 2019 09:47:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8N9l57n022931 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Sep 2019 05:47:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4C8021001B08; Mon, 23 Sep 2019 09:47:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5631101E678;
	Mon, 23 Sep 2019 09:46:59 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 158D73084212;
	Mon, 23 Sep 2019 09:46:59 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p7so9098457wmp.4;
	Mon, 23 Sep 2019 02:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=5elTXzM6xlr8PjUTcrYvX5g+KiCaroLiG/40wyuwe8s=;
	b=IXLOA+1T4aETvd3O9XWO8iNbUKNrgVGLqUimU+DN5SdqYCrVRZFp8ITqo/SWtvODY0
	do42IgUiw7g5IRxm+5mARa1kr+2mJZ9xHZG5RtJdz3jQy78nhtyO+hhK2LRtxaXt6vAA
	GJSvkFzeWH/nmuHeBbublaFZmxG4xXf7MtqxuhtFTm5rPWEOb0IEx9q5mpsYyQplCcIs
	2Jp5ygJxcv+yaVO2bscDRYdWJYIHUEZJPZEu9SKFIreP4Y5NTUo6GQBQ05dVJkncyigx
	5PuEw/l0x/EC+6GoSsSAU7sLk6gnXsA0W/Hofb6yWadlH/VJOt4hIJbHEixQxjNPsFr1
	FFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5elTXzM6xlr8PjUTcrYvX5g+KiCaroLiG/40wyuwe8s=;
	b=r+EbCTGqlobZ9oXsfkzMT6a+0arqWLD0fRKg80YKYHpW7Ad4fdjyW7V3AJWMzmWDtL
	ePwGLmcDZ79AAv50rTa4xEH9Du5UdZtzy6FnSDBWdg9zK3qHzRwXQcGbz8ulcjX+/hUO
	GVOO83QVqNKWntrgP/bmZFyS5p4tGSa0fpkJF6LPMaMOAlLL6x5J89QmbgNQF86r75zg
	RgeJtsyOHEa3R8+8XbLydowlgOJCM1TFmOPtXRtGikU3qb4qSNnFuPE5xy3On/nlj0vc
	CunDDPp9Bw3c6QK4o58H2gi2G/QTbk8gCgNFYMvj46TwNf877uPfzx4jOgd+lbLyLUiF
	2Ljg==
X-Gm-Message-State: APjAAAXXeDHl9mNXS9sk7E2l6CqLqIZka4vswWgkmXo1ATVYZirlvfHF
	wkgDPTyK635nevgWabO/TGgL627s
X-Google-Smtp-Source: APXvYqy93ietjX1bSVrNtVPwZS+jbfnCafIE+1DjFr1b+2lowlovhD+hOJDzgtxTj7pFEKe6Yu2tnQ==
X-Received: by 2002:a05:600c:241:: with SMTP id
	1mr12931695wmj.162.1569232017788; 
	Mon, 23 Sep 2019 02:46:57 -0700 (PDT)
Received: from [10.43.17.245] (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.gmail.com with ESMTPSA id
	o19sm13347126wro.50.2019.09.23.02.46.56
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 23 Sep 2019 02:46:57 -0700 (PDT)
To: Thibaut Sautereau <thibaut.sautereau@clip-os.org>,
	Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com,
	Alasdair Kergon <agk@redhat.com>, linux-kernel@vger.kernel.org
References: <20190920154434.GA923@gandi.net>
	<20190920173707.GA21143@redhat.com>
	<13e25b01-f344-ea1d-8f6c-9d0a60eb1e0f@gmail.com>
	<20190920212746.GA22061@redhat.com> <20190920214758.GA162854@gmail.com>
	<20190923082016.GA913@gandi.net>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <f820c3e8-8538-ac95-9303-eeee77c903ee@gmail.com>
Date: Mon, 23 Sep 2019 11:46:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190923082016.GA913@gandi.net>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 23 Sep 2019 09:46:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Mon, 23 Sep 2019 09:46:59 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] dm-crypt error when CONFIG_CRYPTO_AUTHENC is disabled
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Mon, 23 Sep 2019 09:47:29 +0000 (UTC)

On 23/09/2019 10:20, Thibaut Sautereau wrote:
> 
> On top of that, there's no hint in kernel logs about a particular
> algorithm, feature or Kconfig option that could be missing. Do we really
> expect people simply tuning their kernel configuration to go and read
> the source code to ensure they are not breaking their system?

AFAIK all standard Linux kernels in distros have these options enabled,
so it works out of the box.

So it is the opposite view - if you are setting your kernel options,
you need to dig much deeper...

I can perhaps add some hint to userspace if this is detectable from errno though.

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
