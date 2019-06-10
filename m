Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FEC3C568
	for <lists+dm-devel@lfdr.de>; Tue, 11 Jun 2019 09:50:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8109DC18B2EB;
	Tue, 11 Jun 2019 07:50:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEADB5D967;
	Tue, 11 Jun 2019 07:50:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC81854D3C;
	Tue, 11 Jun 2019 07:50:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5ANRwG6012919 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Jun 2019 19:28:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3B78C60C47; Mon, 10 Jun 2019 23:27:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEAEF60BF1;
	Mon, 10 Jun 2019 23:27:53 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by mx1.redhat.com (Postfix) with ESMTP id 8F27B81F11;
	Mon, 10 Jun 2019 23:27:29 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1029)
	id 2B7FD20B7194; Mon, 10 Jun 2019 16:27:21 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by linux.microsoft.com (Postfix) with ESMTP id 25042311B1C8;
	Mon, 10 Jun 2019 16:27:21 -0700 (PDT)
Date: Mon, 10 Jun 2019 16:27:21 -0700 (PDT)
From: Jaskaran Singh Khurana <jaskarankhurana@linux.microsoft.com>
X-X-Sender: jaskarankhurana@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
To: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <54170d18-31c7-463d-10b5-9af8b666df0f@gmail.com>
Message-ID: <alpine.LRH.2.21.1906101624350.31134@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
References: <20190607223140.16979-1-jaskarankhurana@linux.microsoft.com>
	<20190607223140.16979-2-jaskarankhurana@linux.microsoft.com>
	<54170d18-31c7-463d-10b5-9af8b666df0f@gmail.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Mon, 10 Jun 2019 23:27:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Mon, 10 Jun 2019 23:27:38 +0000 (UTC) for IP:'13.77.154.182'
	DOMAIN:'linux.microsoft.com' HELO:'linux.microsoft.com'
	FROM:'jaskarankhurana@linux.microsoft.com' RCPT:''
X-RedHat-Spam-Score: -8.002  (ENV_AND_HDR_SPF_MATCH, SPF_HELO_PASS, SPF_PASS,
	USER_IN_DEF_SPF_WL) 13.77.154.182 linux.microsoft.com
	13.77.154.182 linux.microsoft.com
	<jaskarankhurana@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 11 Jun 2019 03:46:30 -0400
Cc: scottsh@microsoft.com, dm-devel@redhat.com, snitzer@redhat.com,
	ebiggers@google.com, linux-kernel@vger.kernel.org,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	Mikulas Patocka <mpatocka@redhat.com>,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH v3 1/1] Add dm verity root hash pkcs7 sig
 validation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 11 Jun 2019 07:50:38 +0000 (UTC)



On Sat, 8 Jun 2019, Milan Broz wrote:

> On 08/06/2019 00:31, Jaskaran Khurana wrote:
>> The verification is to support cases where the roothash is not secured by
>
>> +	key = request_key(&key_type_user,
>> +			key_desc, NULL);
>> +	if (IS_ERR(key))
>> +		return PTR_ERR(key);
>
> You will need dependence on keyring here (kernel can be configured without it),
> try to compile it without CONFIG_KEYS selected.
>
> I think it is ok that  DM_VERITY_VERIFY_ROOTHASH_SIG can directly require CONFIG_KEYS.
> (Add depends on CONFIG_KEYS in KConfig)
>

DM_VERITY_VERIFY_ROOTHASH_SIG selects SYSTEM_DATA_VERIFICATION and 
SYSTEM_DATA_VERIFICATION selects KEYS so we should be OK here.

>
> Thanks,
> Milan
>
Thanks,
Jaskaran.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
