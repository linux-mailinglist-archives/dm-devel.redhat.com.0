Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 03C002F4CF9
	for <lists+dm-devel@lfdr.de>; Wed, 13 Jan 2021 15:20:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-GqFWggpZNKKZjkwe_KhpUw-1; Wed, 13 Jan 2021 09:20:43 -0500
X-MC-Unique: GqFWggpZNKKZjkwe_KhpUw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9DC2100C63A;
	Wed, 13 Jan 2021 14:20:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 583605D9EF;
	Wed, 13 Jan 2021 14:20:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D1BF84A7C6;
	Wed, 13 Jan 2021 14:20:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10CIPKxX027675 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 12 Jan 2021 13:25:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8F676110E9AE; Tue, 12 Jan 2021 18:25:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B34F110E9AB
	for <dm-devel@redhat.com>; Tue, 12 Jan 2021 18:25:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B370186E120
	for <dm-devel@redhat.com>; Tue, 12 Jan 2021 18:25:16 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-321-kWs__zQOOj2JdUs2RA0VDA-1;
	Tue, 12 Jan 2021 13:25:14 -0500
X-MC-Unique: kWs__zQOOj2JdUs2RA0VDA-1
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7792220B6C40;
	Tue, 12 Jan 2021 10:25:11 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7792220B6C40
To: Paul Moore <paul@paul-moore.com>,
	Tushar Sugandhi <tusharsu@linux.microsoft.com>
References: <20210108040708.8389-1-tusharsu@linux.microsoft.com>
	<20210108040708.8389-9-tusharsu@linux.microsoft.com>
	<CAHC9VhSJk0wG=WzO3bwsueiy19mMi9m6MamTrQfH8C=gXUtvGw@mail.gmail.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <1b076701-3af8-6997-82ae-7196c263a7f4@linux.microsoft.com>
Date: Tue, 12 Jan 2021 10:25:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSJk0wG=WzO3bwsueiy19mMi9m6MamTrQfH8C=gXUtvGw@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 13 Jan 2021 09:20:09 -0500
Cc: sashal@kernel.org, dm-devel@redhat.com, snitzer@redhat.com,
	selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>,
	James Morris <jmorris@namei.org>, zohar@linux.ibm.com,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, casey@schaufler-ca.com,
	linux-integrity@vger.kernel.org, gmazyland@gmail.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v10 8/8] selinux: include a consumer of the
 new IMA critical data hook
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 1/12/21 8:27 AM, Paul Moore wrote:
> On Thu, Jan 7, 2021 at 11:07 PM Tushar Sugandhi
> <tusharsu@linux.microsoft.com> wrote:
>> From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>>
>> SELinux stores the active policy in memory, so the changes to this data
>> at runtime would have an impact on the security guarantees provided
>> by SELinux.  Measuring in-memory SELinux policy through IMA subsystem
>> provides a secure way for the attestation service to remotely validate
>> the policy contents at runtime.
>>
>> Measure the hash of the loaded policy by calling the IMA hook
>> ima_measure_critical_data().  Since the size of the loaded policy
>> can be large (several MB), measure the hash of the policy instead of
>> the entire policy to avoid bloating the IMA log entry.
>>
>> To enable SELinux data measurement, the following steps are required:
>>
>> 1, Add "ima_policy=critical_data" to the kernel command line arguments
>>     to enable measuring SELinux data at boot time.
>> For example,
>>    BOOT_IMAGE=/boot/vmlinuz-5.10.0-rc1+ root=UUID=fd643309-a5d2-4ed3-b10d-3c579a5fab2f ro nomodeset security=selinux ima_policy=critical_data
>>
>> 2, Add the following rule to /etc/ima/ima-policy
>>     measure func=CRITICAL_DATA label=selinux
>>
>> Sample measurement of the hash of SELinux policy:
>>
>> To verify the measured data with the current SELinux policy run
>> the following commands and verify the output hash values match.
>>
>>    sha256sum /sys/fs/selinux/policy | cut -d' ' -f 1
>>
>>    grep "selinux-policy-hash" /sys/kernel/security/integrity/ima/ascii_runtime_measurements | tail -1 | cut -d' ' -f 6
>>
>> Note that the actual verification of SELinux policy would require loading
>> the expected policy into an identical kernel on a pristine/known-safe
>> system and run the sha256sum /sys/kernel/selinux/policy there to get
>> the expected hash.
>>
>> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>> Suggested-by: Stephen Smalley <stephen.smalley.work@gmail.com>
>> Reviewed-by: Tyler Hicks <tyhicks@linux.microsoft.com>
>> ---
>>   Documentation/ABI/testing/ima_policy |  3 +-
>>   security/selinux/Makefile            |  2 +
>>   security/selinux/ima.c               | 64 ++++++++++++++++++++++++++++
>>   security/selinux/include/ima.h       | 24 +++++++++++
>>   security/selinux/include/security.h  |  3 +-
>>   security/selinux/ss/services.c       | 64 ++++++++++++++++++++++++----
>>   6 files changed, 149 insertions(+), 11 deletions(-)
>>   create mode 100644 security/selinux/ima.c
>>   create mode 100644 security/selinux/include/ima.h
> 
> I remain concerned about the possibility of bypassing a measurement by
> tampering with the time, but I appear to be the only one who is
> worried about this so I'm not going to block this patch on those
> grounds.
> 
> Acked-by: Paul Moore <paul@paul-moore.com>

Thanks Paul.

  -lakshmi

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

