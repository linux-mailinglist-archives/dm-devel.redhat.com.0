Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C509D5028E
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 08:53:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 854A587628;
	Mon, 24 Jun 2019 06:53:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B48460925;
	Mon, 24 Jun 2019 06:53:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 181A41806B16;
	Mon, 24 Jun 2019 06:52:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5O6qYZE006802 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 02:52:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D77795D739; Mon, 24 Jun 2019 06:52:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D16B85B687
	for <dm-devel@redhat.com>; Mon, 24 Jun 2019 06:52:32 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BE9A64ACDF
	for <dm-devel@redhat.com>; Mon, 24 Jun 2019 06:52:14 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id f15so2681336wrp.2
	for <dm-devel@redhat.com>; Sun, 23 Jun 2019 23:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=CXj7EcHXfZQG+ULuS9k1X3crNZy9bY3cT9sIZIipFpE=;
	b=oGaEafgHZd7moSrSQ6D45tbG5l4DdlEkpwFd7sQA8Y0d8IgICxtZkA9d9Rgc/s6uar
	+Sdd/QAAgKObk1xW+UtAh+BXvRyTKDdzsCNtPtkwCFacdHhzAuHwY7wPrUQbYrGhqoHF
	OmeY0bIvQ2kp/7FsYUZ+h4K4wlUSimb2+pie+ZBCkvxdoeevqIDlOmg5EY0tUsm4vvP1
	QgOGOtBugP+cCBPm5h25eeY97jIFwJhckAuufFE6t0QjOqV/d1x2ouqrIAxTo/gjiTpB
	Yo3B34ugM0IhEKINvCWXXlMweJOpSncMlkhZKBSKK4XBwCCsjCzuYPA4B8rSGRa7caId
	cJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CXj7EcHXfZQG+ULuS9k1X3crNZy9bY3cT9sIZIipFpE=;
	b=EHYorkh5Bal0moLhOAyyJd8OJYTxYw8IKxzpa7D8fKm4W8XnxpufXwGVO0oMkOQt8x
	ZRgRokiH43x1b3xOHnZwJXrzcXegw6LPiaf4zaeZbY8upCLYEmr/+iSL/FUSq9RN1scD
	FtbtWsaYh+vF5+z+GZ0c5VcxkRV8oM97Tk4uuYyHrp9wxfjHdhLZfOD1N+sXJafVFSyN
	xSNVv0UXQSQtOThhi8LSRTuXahWV4M7iVRgD4R+b+TraRWHE4fL6tJe+3McivKsRUxIG
	JZD/vPxyCHQs2rYUZx3zpjQVku0vUhiF6eBhe8GH/MMGVjFhvLaPzWfFGYWhjLllZ+zj
	2QGQ==
X-Gm-Message-State: APjAAAUz4teIigCxZ/tUHxa8eAn2OtVs8N4S2dxWCtLw7LAfVRwJxmpI
	zbntmX42Ge25c9bRO5rKhDM=
X-Google-Smtp-Source: APXvYqy9M0ufMnCjzTHTXqIB8vH/HLBE4Q0+Khju+56/6idlT7wXUBIq+uW9cugeU8pMDf/RnFHqww==
X-Received: by 2002:adf:df10:: with SMTP id y16mr21102817wrl.302.1561359133444;
	Sun, 23 Jun 2019 23:52:13 -0700 (PDT)
Received: from [172.22.36.64] (redhat-nat.vtp.fi.muni.cz. [78.128.215.6])
	by smtp.gmail.com with ESMTPSA id
	w185sm13479825wma.39.2019.06.23.23.52.12
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Jun 2019 23:52:12 -0700 (PDT)
To: Herbert Xu <herbert@gondor.apana.org.au>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <20190621080918.22809-1-ard.biesheuvel@arm.com>
	<CAKv+Gu-ZO9Fnfx06XYJ-tp+6nrk0D8TBGa2chmxFW-kjPMmLCw@mail.gmail.com>
	<20190623101241.6cr4sbxyviigu3sz@gondor.apana.org.au>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <5ebd992b-cb01-6dcc-f571-55afbb05c03b@gmail.com>
Date: Mon, 24 Jun 2019 08:52:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190623101241.6cr4sbxyviigu3sz@gondor.apana.org.au>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 24 Jun 2019 06:52:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Mon, 24 Jun 2019 06:52:14 +0000 (UTC) for IP:'209.85.221.66'
	DOMAIN:'mail-wr1-f66.google.com' HELO:'mail-wr1-f66.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.109  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.66 mail-wr1-f66.google.com 209.85.221.66
	mail-wr1-f66.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fscrypt@vger.kernel.org, linux-crypto@vger.kernel.org,
	Eric Biggers <ebiggers@google.com>
Subject: Re: [dm-devel] [PATCH v4 0/6] crypto: switch to crypto API for
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 24 Jun 2019 06:53:42 +0000 (UTC)

On 23/06/2019 12:12, Herbert Xu wrote:
> On Sun, Jun 23, 2019 at 11:30:41AM +0200, Ard Biesheuvel wrote:
>>
>> So with that in mind, I think we should decouple the multi-sector
>> discussion and leave it for a followup series, preferably proposed by
>> someone who also has access to some hardware to prototype it on.
> 
> Yes that makes sense.

Yes.

And TBH, the most important optimization for dm-crypt in this case
is processing 8 512-bytes sectors in 4k encryption block (because page
cache will generate page-sized bios) and with XTS mode and linear IV (plain64),
not ESSIV.

Dm-crypt can use 4k sectors directly, there are only two
blockers - you need LUKS2 to support it, and many devices
just do not advertise physical 4k sectors (many SSDs).
So switching to 4k could cause some problems with partial 4k writes
(after a crash or power-fail).

The plan for the dm-crypt side is more to focus on using 4k native
sectors than this micro-optimization in HW.

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
