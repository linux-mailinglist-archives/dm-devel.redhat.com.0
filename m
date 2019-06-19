Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C884B918
	for <lists+dm-devel@lfdr.de>; Wed, 19 Jun 2019 14:51:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 245603086233;
	Wed, 19 Jun 2019 12:50:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D8665D9E5;
	Wed, 19 Jun 2019 12:50:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF5D818089C8;
	Wed, 19 Jun 2019 12:50:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5JCngI4031413 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jun 2019 08:49:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5E5AA2C8CE; Wed, 19 Jun 2019 12:49:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58CC760DDF
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 12:49:40 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A9076308792E
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 12:49:13 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id k20so37740400ios.10
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 05:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=faG/I5L5O64iZX3wK/LK9TkDFfK1KrG3bylwNO9vZC4=;
	b=EYvm4nLNVkbxf6Y1mBcvQpptZxhwgHOw6SalKjBwSA32lrfQuYQl5YtvzpCYgeFeKx
	IFqAcXWlttp+HyRzjlxYr7e4r5J2BZb2Fkf/MfGYZGodfNYyjKRO1xRE0PziFs3VdRs4
	kCDyCXXMWlkA10KcD9W10q/CfcVxHQ92vFCBTiPCfzBKU64C5K/SRbe9W1+jIa3h6hUT
	Mj7YuAnbSpH5RCJbj/e9bNU09TC9KXjHAeFm2mlHk+GjTKUYCweN25CHi2dpLhp13+l3
	h8NCm29DEOAR9tIponJt/dmAfOWegPDesYC0IptaYLABEEuDncclzrqT8AUq+K/bkRs/
	J3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=faG/I5L5O64iZX3wK/LK9TkDFfK1KrG3bylwNO9vZC4=;
	b=fbR/N+fsdJDIWqW4/JqZhxPTcLXBIfg8b9OferZHVr1uVkqD0udPoR28pJq791dvrA
	eDx2fT0UyOJ9vPeuAk5lQoXDgvQVGi4Kb9cZvnJcRnkg88MrHSSlsl5+nedTJJRHUUGE
	15n+aikea3efX9a3JPqUJhfzaXCcng59tYre8Cf9IYkOrdKFdWPKT0wcE/+srkXXNpae
	NoDI1HRhlNN7m/n+d5nJYHDuB2aS43VegZdq9hjtKcygOP6ssdXnf6GZjDaMsdfl2j2h
	gK49oICUAVtURR2YG7GYET33kQmgrWF9cAnNwkOqi5skZ7Z1u7nyL9cHCGdbVrsAJZ6a
	f6Cg==
X-Gm-Message-State: APjAAAXl1TdLiPXUZ+2I3gFrc7rAKPIqDL23mMBw/nXQQrLf4IYQluE5
	wrGzn7Et1WZ73JlxvBqDfQs4y+oWRl4I4booj5VxSQ==
X-Google-Smtp-Source: APXvYqzRcMuq5XNUWEu3mtRfQNKEUWRpNvECOkLF4wsGTX9R6rUHP5bFIhp2tdX4fWQk7lgXXRGthPuc22K5D78gFgw=
X-Received: by 2002:a5d:9d83:: with SMTP id 3mr82030868ion.65.1560948552949;
	Wed, 19 Jun 2019 05:49:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190618212749.8995-1-ard.biesheuvel@linaro.org>
	<099346ee-af6e-a560-079d-3fb68fb4eeba@gmail.com>
	<CAKv+Gu9MTGSwZgaHyxJKwfiBQzqgNhTs5ue+TC1Ehte-+VBXqg@mail.gmail.com>
	<CAKv+Gu9q5qTgEeTLCW6ZM6Wu6RK559SjFhsgWis72_6-p6RrZA@mail.gmail.com>
	<f5de99dd-0b6a-9f7e-46b7-cd3c5ed3100e@gmail.com>
	<CAKv+Gu9NW2H-TDd66quKSUMpEWGwqEjN-vmf_zueo1tEJLa-xg@mail.gmail.com>
	<b5b013eb-9cab-4985-9c24-563cc57c140e@gmail.com>
	<CAKv+Gu91RHpwE6XzdFYcsN77DRJ-4OsFRjxNAyKk92Q3q6dCYw@mail.gmail.com>
In-Reply-To: <CAKv+Gu91RHpwE6XzdFYcsN77DRJ-4OsFRjxNAyKk92Q3q6dCYw@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 19 Jun 2019 14:49:02 +0200
Message-ID: <CAKv+Gu_XFbB9TTjMO+=QmZ40H1LV5DB57-zeUEb9dN3yNyia=w@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Wed, 19 Jun 2019 12:49:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Wed, 19 Jun 2019 12:49:13 +0000 (UTC) for IP:'209.85.166.66'
	DOMAIN:'mail-io1-f66.google.com' HELO:'mail-io1-f66.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: 0.191  (DKIM_INVALID, DKIM_SIGNED, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE) 209.85.166.66 mail-io1-f66.google.com
	209.85.166.66 mail-io1-f66.google.com
	<ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH v2 0/4] crypto: switch to crypto API for
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Wed, 19 Jun 2019 12:51:12 +0000 (UTC)

On Wed, 19 Jun 2019 at 14:36, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
> On Wed, 19 Jun 2019 at 13:33, Milan Broz <gmazyland@gmail.com> wrote:
> >
> > On 19/06/2019 13:16, Ard Biesheuvel wrote:
> > >> Try
> > >>   cryptsetup open --type plain -c null /dev/sdd test -q
> > >> or
> > >>   dmsetup create test --table " 0 417792 crypt cipher_null-ecb - 0 /dev/sdd 0"
> > >>
> > >> (or just run full cryptsetup testsuite)
> > >>
> > >
> > > Is that your mode-test script?
> > >
> > > I saw some errors about the null cipher, but tbh, it looked completely
> > > unrelated to me, so i skipped those for the moment. But now, it looks
> > > like it is related after all.
> >
> > This was triggered by align-test, mode-test fails the same though.
> >
> > It is definitely related, I think you just changed the mode parsing in dm-crypt.
> > (cipher null contains only one dash I guess).
> >
>
> On my unpatched 4.19 kernel, mode-test gives me
>
> $ sudo ./mode-test
> aes                            PLAIN:[table OK][status OK]
> LUKS1:[table OK][status OK] CHECKSUM:[OK]
> aes-plain                      PLAIN:[table OK][status OK]
> LUKS1:[table OK][status OK] CHECKSUM:[OK]
> null                           PLAIN:[table OK][status OK]
> LUKS1:[table OK][status OK] CHECKSUM:[OK]
> cipher_null                    PLAIN:[table FAIL]
>  Expecting cipher_null-ecb got cipher_null-cbc-plain.
> FAILED at line 64 ./mode-test
>
> which is why I commented out those tests in the first place.
>
> I can reproduce the crash after I re-enable them again, so I will need
> to look into that. But something seems to be broken already.
> Note that this is running on arm64 using a kconfig based on the Debian kernel.

Actually, could this be an issue with cryptsetup being out of date? On
another arm64 system with a more recent distro, it works fine

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
