Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D47BF5B67E
	for <lists+dm-devel@lfdr.de>; Mon,  1 Jul 2019 10:13:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B39D330842B0;
	Mon,  1 Jul 2019 08:13:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61D1D6B8C4;
	Mon,  1 Jul 2019 08:13:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3E28A1833001;
	Mon,  1 Jul 2019 08:13:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5SNRcGJ032256 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 28 Jun 2019 19:27:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7076460C82; Fri, 28 Jun 2019 23:27:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADD5C60BE0;
	Fri, 28 Jun 2019 23:27:30 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by mx1.redhat.com (Postfix) with ESMTP id 7A04F30C0DCC;
	Fri, 28 Jun 2019 23:27:29 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1029)
	id 07D5F2007697; Fri, 28 Jun 2019 16:27:28 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by linux.microsoft.com (Postfix) with ESMTP id DD9873007AB2;
	Fri, 28 Jun 2019 16:27:28 -0700 (PDT)
Date: Fri, 28 Jun 2019 16:27:28 -0700 (PDT)
From: Jaskaran Singh Khurana <jaskarankhurana@linux.microsoft.com>
X-X-Sender: jaskarankhurana@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20190628203450.GD103946@gmail.com>
Message-ID: <alpine.LRH.2.21.1906281552350.26685@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
References: <20190619191048.20365-1-jaskarankhurana@linux.microsoft.com>
	<20190628040041.GB673@sol.localdomain>
	<alpine.LRH.2.21.1906281242110.2789@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
	<20190628203450.GD103946@gmail.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Fri, 28 Jun 2019 23:27:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Fri, 28 Jun 2019 23:27:29 +0000 (UTC) for IP:'13.77.154.182'
	DOMAIN:'linux.microsoft.com' HELO:'linux.microsoft.com'
	FROM:'jaskarankhurana@linux.microsoft.com' RCPT:''
X-RedHat-Spam-Score: -8.002  (ENV_AND_HDR_SPF_MATCH, SPF_HELO_PASS, SPF_PASS,
	USER_IN_DEF_SPF_WL) 13.77.154.182 linux.microsoft.com
	13.77.154.182 linux.microsoft.com
	<jaskarankhurana@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 01 Jul 2019 04:11:25 -0400
Cc: scottsh@microsoft.com, dm-devel@redhat.com, snitzer@redhat.com,
	linux-kernel@vger.kernel.org, jmorris@namei.org,
	linux-security-module@vger.kernel.org, mpatocka@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	gmazyland@gmail.com, agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH v5 0/1] Add dm verity root hash pkcs7 sig
 validation.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 01 Jul 2019 08:13:46 +0000 (UTC)


Hello Eric,

On Fri, 28 Jun 2019, Eric Biggers wrote:

>> In a datacenter like environment, this will protect the system from below
>> attacks:
>>
>> 1.Prevents attacker from deploying scripts that run arbitrary executables on the system.
>> 2.Prevents physically present malicious admin to run arbitrary code on the
>>   machine.
>>
>> Regards,
>> Jaskaran
>
> So you are trying to protect against people who already have a root shell?
>
> Can't they just e.g. run /usr/bin/python and type in some Python code?
>
> Or run /usr/bin/curl and upload all your secret data to their server.
>
> - Eric
>

You are correct, it would not be feasible for a general purpose distro, 
but for embedded systems and other cases where there is a more tightly 
locked-down system.

Regards,
Jaskaran.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
