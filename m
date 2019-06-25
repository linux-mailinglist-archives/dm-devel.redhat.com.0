Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F9455759
	for <lists+dm-devel@lfdr.de>; Tue, 25 Jun 2019 20:45:01 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BEB3B308FBAC;
	Tue, 25 Jun 2019 18:44:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D25D56085B;
	Tue, 25 Jun 2019 18:43:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3E01D1806B1B;
	Tue, 25 Jun 2019 18:43:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5PIKBOv012824 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 14:20:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BA11C19936; Tue, 25 Jun 2019 18:20:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BFC51972E;
	Tue, 25 Jun 2019 18:20:05 +0000 (UTC)
Date: Tue, 25 Jun 2019 14:20:04 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>, gmazyland@gmail.com
Message-ID: <20190625182004.GA32075@redhat.com>
References: <20190619191048.20365-1-jaskarankhurana@linux.microsoft.com>
	<20190619191048.20365-2-jaskarankhurana@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619191048.20365-2-jaskarankhurana@linux.microsoft.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: scottsh@microsoft.com, dm-devel@redhat.com, ebiggers@google.com,
	linux-kernel@vger.kernel.org, jmorris@namei.org,
	linux-security-module@vger.kernel.org, mpatocka@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH v5 1/1] Add dm verity root hash pkcs7 sig
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Tue, 25 Jun 2019 18:44:55 +0000 (UTC)

On Wed, Jun 19 2019 at  3:10pm -0400,
Jaskaran Khurana <jaskarankhurana@linux.microsoft.com> wrote:

> The verification is to support cases where the roothash is not secured by
> Trusted Boot, UEFI Secureboot or similar technologies.
> One of the use cases for this is for dm-verity volumes mounted after boot,
> the root hash provided during the creation of the dm-verity volume has to
> be secure and thus in-kernel validation implemented here will be used
> before we trust the root hash and allow the block device to be created.
> 
> The signature being provided for verification must verify the root hash and
> must be trusted by the builtin keyring for verification to succeed.
> 
> The hash is added as a key of type "user" and the description is passed to 
> the kernel so it can look it up and use it for verification.
> 
> Kernel commandline parameter will indicate whether to check (only if 
> specified) or force (for all dm verity volumes) roothash signature 
> verification.
> 
> Kernel commandline: dm_verity.verify_sig=1 or 2 for check/force root hash
> signature validation respectively.
> 
> Signed-off-by: Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>

Milan and/or others: could you please provide review and if you're OK
with this patch respond accordingly?

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
