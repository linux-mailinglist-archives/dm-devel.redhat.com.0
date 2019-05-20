Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4BB23DC8
	for <lists+dm-devel@lfdr.de>; Mon, 20 May 2019 18:47:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C9113C057E65;
	Mon, 20 May 2019 16:46:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64339600C6;
	Mon, 20 May 2019 16:46:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 004835B424;
	Mon, 20 May 2019 16:46:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4KGjNX2020677 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 May 2019 12:45:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ACB4817257; Mon, 20 May 2019 16:45:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5C665C297
	for <dm-devel@redhat.com>; Mon, 20 May 2019 16:45:19 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40026772EE
	for <dm-devel@redhat.com>; Mon, 20 May 2019 16:45:08 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t5so42839wmh.3
	for <dm-devel@redhat.com>; Mon, 20 May 2019 09:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=QVcCri+AEIktljEBPjh6Zhi+3fgQ3tYmp0k1KRXCkt0=;
	b=fWSYSkMlrqQsrhQqLVTDu9S1Xz93dHsQPkQZsEWJr7rhuMJRiee83Z6OGXNKNiw5nB
	B7ZuBtT5RdCrncnLO2jstZCUJX0ncmXms5CWUpVS/N8nzX7CCFug5l5glONCDwv6iGUk
	giF85XLs4lSvwqABItd3EJg2ram4qr3CFER6xDVrpVT0Fwc9ItLHcauRC+RjuT6F+B/3
	j5NZwnHAS7ax0jVFaiXy7m4TebC/TNumWQriDj2ITvsbs9v1+vCZaxIl4UoCa4WRUwUz
	D1wGQIutNok1LH8HvC5IktnWMaW8Ah4TQV80oGS9Mlr/yLSIy/+KP9Xm3uDB+nxr0b6T
	tGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QVcCri+AEIktljEBPjh6Zhi+3fgQ3tYmp0k1KRXCkt0=;
	b=X2bW+VSCluzflYqa4yu+PMfbVnhhVjMzPpQGMtvIJlb9v3AaS8oFqhGhD7eVoWkQDf
	kt7VURVGgZ313tRs+ErANQvmVkDAqBZ18PLzOH1iXFzyTVRpsL8lV2+pEELA1t6E3i0z
	+ePpvxL2BvjSsFXG97oZxHCHDONn47oadyUf0n4530QtZNQxJ5CxNbvcJYS1ksPP6yrB
	FgZtNada3Ek0Cfa033Ybh1NNO4T/FSAMApN59hreqfLHxuE3fWaWzLMRANs1MYmGjFQU
	NLn1oghzGcX/+q3oFzeNAfTNCyVt2DVpKODZFh0sVLQq1PMbDqaKrr37+Bskn6gC/4LT
	Zu7A==
X-Gm-Message-State: APjAAAUzZbY9YKD6fx9FcX9WcYDaxwsBv5hlOXBF31kzbWqSJH7tunZQ
	sF0/Cn3K1GSQIUFXS3EZUtnapvda
X-Google-Smtp-Source: APXvYqwZYII4urrY03OVQRdBJaVH9H80p+yhyfh8IKA4G7HJovsn0UDqiciOFcitenXwWK8lXgbXOA==
X-Received: by 2002:a7b:ce8c:: with SMTP id q12mr40749wmj.33.1558370706594;
	Mon, 20 May 2019 09:45:06 -0700 (PDT)
Received: from [192.168.2.28] (39.35.broadband4.iol.cz. [85.71.35.39])
	by smtp.gmail.com with ESMTPSA id
	a10sm21043230wrm.94.2019.05.20.09.45.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 09:45:06 -0700 (PDT)
To: Andrea Gelmini <andrea.gelmini@gelma.net>, =?UTF-8?Q?Michael_La=c3=9f?=
	<bevan@bi-co.net>
References: <297da4cbe20235080205719805b08810@bi-co.net>
	<CAJCQCtR-uo9fgs66pBMEoYX_xAye=O-L8kiMwyAdFjPS5T4+CA@mail.gmail.com>
	<8C31D41C-9608-4A65-B543-8ABCC0B907A0@bi-co.net>
	<CAJCQCtTZWXUgUDh8vn0BFeEbAdKToDSVYYw4Q0bt0rECQr9nxQ@mail.gmail.com>
	<AD966642-1043-468D-BABF-8FC9AF514D36@bi-co.net>
	<158a3491-e4d2-d905-7f58-11a15bddcd70@gmx.com>
	<C1CD4646-E75D-4AAF-9CD6-B3AC32495FD3@bi-co.net>
	<CAK-xaQYPs62v971zm1McXw_FGzDmh_vpz3KLEbxzkmrsSgTfXw@mail.gmail.com>
	<9D4ECE0B-C9DD-4BAD-A764-9DE2FF2A10C7@bi-co.net>
	<CAK-xaQYakXcAbhfiH_VbqWkh+HBJD5N69ktnnA7OnWdhL6fDLA@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <ea5552b8-7b6a-2516-d968-c3f3c731e159@gmail.com>
Date: Mon, 20 May 2019 18:45:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAK-xaQYakXcAbhfiH_VbqWkh+HBJD5N69ktnnA7OnWdhL6fDLA@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 20 May 2019 16:45:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Mon, 20 May 2019 16:45:08 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.109  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Chris Murphy <lists@colorremedies.com>,
	Btrfs BTRFS <linux-btrfs@vger.kernel.org>,
	Qu Wenruo <quwenruo.btrfs@gmx.com>
Subject: Re: [dm-devel] fstrim discarding too many or wrong blocks on Linux
 5.1, leading to data loss
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 20 May 2019 16:47:25 +0000 (UTC)

On 20/05/2019 16:53, Andrea Gelmini wrote:
...
> Also, changing crypttab:
> root@glet:~# cat /etc/crypttab
> sda6_crypt UUID=fe03e2e6-b8b1-4672-8a3e-b536ac4e1539 none luks,discard
> 
> removing discard didn't solve the issue.

This is very strange, disabling discard should reject every discard IO
on the dmcrypt layer. Are you sure it was really disabled?

Note, it is the root filesystem, so you have to regenerate initramfs
to update crypttab inside it.

Could you paste "dmsetup table" and "lsblk -D" to verify that discard flag
is not there?
(I mean dmsetup table with the zeroed key, as a default and safe output.)

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
