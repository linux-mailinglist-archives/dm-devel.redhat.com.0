Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0AC682B0A
	for <lists+dm-devel@lfdr.de>; Tue, 31 Jan 2023 12:01:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675162885;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oiKawzQX65qTTGQ84HhObIiotJk8GoXlK2MmGzt7RP0=;
	b=Z9yaTzr8AJxcvDHemn0KroD4evDeecwPhNB42O1nRT68mnDEMSFk28UI03yCEJ8j08ALcj
	sGLpQ6Nj92efmsvOd+gnpgLIE21OxpodmVmKaYq9paWbj9Si2oCUKTYsMJyGzPtmec14QT
	iANqF6RpwiHqp6vApJQ2t4JPeFMjNBs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-QdPRqRh0Nzi9zQ7ELY1OEw-1; Tue, 31 Jan 2023 06:01:23 -0500
X-MC-Unique: QdPRqRh0Nzi9zQ7ELY1OEw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E393811E9C;
	Tue, 31 Jan 2023 11:01:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC0E740C2064;
	Tue, 31 Jan 2023 11:01:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0533D19465A3;
	Tue, 31 Jan 2023 11:01:16 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9CFB01946587
 for <dm-devel@listman.corp.redhat.com>; Tue, 31 Jan 2023 11:01:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 591CC422F2; Tue, 31 Jan 2023 11:01:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5090C175A2
 for <dm-devel@redhat.com>; Tue, 31 Jan 2023 11:01:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AC138027F5
 for <dm-devel@redhat.com>; Tue, 31 Jan 2023 11:01:14 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-475-feXKtFDANl-vXwxJINaYZg-1; Tue, 31 Jan 2023 06:01:12 -0500
X-MC-Unique: feXKtFDANl-vXwxJINaYZg-1
Received: by mail-wm1-f50.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso10278407wmq.5
 for <dm-devel@redhat.com>; Tue, 31 Jan 2023 03:01:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AO39XCGd2DcS57mcxGhr0j2AbiFgK/rUF5YALCannN8=;
 b=6lOqeF4tu3NSxXAFDEYjgGN7uV4bNmpEjWNzeHRz2N887bIqpQoKhhUMNpGV15Kr8R
 CgQFg6+cccIByMGqzvRfZDnKnKlL77pr7FWlXxfMkeEzpE5SmC8fSh8a0y2Qcq4aokD+
 RHGLc1yY0kLe/AmhHxt59mNz3lHuXY9VkNNy8zvvYwLytOIURpWvXs4jHLEhd7QPnpsZ
 ni4cWAZAkSO0YrRJ4/VlGyjfM95wfEYnwK/M4yGbMnomXqqB9wJ1Jjum0FGTy9Vj4BBy
 aFvHl+vy6IEmw7jpNTp21dd4lsIzEFvGhhyJ5/k4wK/PT+G16vyZBus2AsA4jnMpf4+r
 JEsQ==
X-Gm-Message-State: AO0yUKVfHvoh3LngEZRaf/7liQSmwrE3iS8uU8qVBEJe2L5F47ufmiNH
 RYWs6pG/VpuSeVETuf01UG91vw==
X-Google-Smtp-Source: AK7set9Ch7VkDOejnAVB048+k9XQj+Z1zVaLfL3c2ZHegtenP6MaP1qGeMn5SPPYIddJ/8oANfoFHQ==
X-Received: by 2002:a05:600c:500d:b0:3dc:eaef:c1bb with SMTP id
 n13-20020a05600c500d00b003dceaefc1bbmr4901268wmr.35.1675162869829; 
 Tue, 31 Jan 2023 03:01:09 -0800 (PST)
Received: from [10.94.1.166] ([185.109.18.135])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c485600b003cffd3c3d6csm15101508wmo.12.2023.01.31.03.01.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 03:01:09 -0800 (PST)
Message-ID: <09c3a87e-0faf-4fe5-88d9-d60e50a0cc8e@arrikto.com>
Date: Tue, 31 Jan 2023 13:01:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Mike Snitzer <snitzer@redhat.com>
References: <20230118122946.20435-1-ntsironis@arrikto.com>
 <Y8geIzYJ4dCeXpEI@redhat.com>
 <2f53c4ee-5bdf-e4e4-2dca-46ae4e22c312@arrikto.com>
 <Y87FHstzOQcHd5f9@redhat.com>
 <c0075cc7-7b34-0f96-6718-b8f1622a7c59@arrikto.com>
 <Y9HEHb7C1cyGduZ4@redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
In-Reply-To: <Y9HEHb7C1cyGduZ4@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [dm-devel] [PATCH 0/2] dm era: avoid deadlock when swapping
 table with dm-era target
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com, snitzer@kernel.org, ejt@redhat.com, agk@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 1/26/23 02:06, Mike Snitzer wrote:
> On Wed, Jan 25 2023 at  7:37P -0500,
> Nikos Tsironis <ntsironis@arrikto.com> wrote:
> 
>> On 1/23/23 19:34, Mike Snitzer wrote:
>>> On Thu, Jan 19 2023 at  4:36P -0500,
>>> Nikos Tsironis <ntsironis@arrikto.com> wrote:
>>>
>>>> On 1/18/23 18:28, Mike Snitzer wrote:
>>>>> On Wed, Jan 18 2023 at  7:29P -0500,
>>>>> Nikos Tsironis <ntsironis@arrikto.com> wrote:
>>>>>
>>>>>> Under certain conditions, swapping a table, that includes a dm-era
>>>>>> target, with a new table, causes a deadlock.
>>>>>>
>>>>>> This happens when a status (STATUSTYPE_INFO) or message IOCTL is blocked
>>>>>> in the suspended dm-era target.
>>>>>>
>>>>>> dm-era executes all metadata operations in a worker thread, which stops
>>>>>> processing requests when the target is suspended, and resumes again when
>>>>>> the target is resumed.
>>>>>>
>>>>>> So, running 'dmsetup status' or 'dmsetup message' for a suspended dm-era
>>>>>> device blocks, until the device is resumed.
>>>>>>
>>>>>> If we then load a new table to the device, while the aforementioned
>>>>>> dmsetup command is blocked in dm-era, and resume the device, we
>>>>>> deadlock.
>>>>>>
>>>>>> The problem is that the 'dmsetup status' and 'dmsetup message' commands
>>>>>> hold a reference to the live table, i.e., they hold an SRCU read lock on
>>>>>> md->io_barrier, while they are blocked.
>>>>>>
>>>>>> When the device is resumed, the old table is replaced with the new one
>>>>>> by dm_swap_table(), which ends up calling synchronize_srcu() on
>>>>>> md->io_barrier.
>>>>>>
>>>>>> Since the blocked dmsetup command is holding the SRCU read lock, and the
>>>>>> old table is never resumed, 'dmsetup resume' blocks too, and we have a
>>>>>> deadlock.
>>>>>>
>>>>>> The only way to recover is by rebooting.
>>>>>>
>>>>>> Steps to reproduce:
>>>>>>
>>>>>> 1. Create device with dm-era target
>>>>>>
>>>>>>        # dmsetup create eradev --table "0 1048576 era /dev/datavg/erameta /dev/datavg/eradata 8192"
>>>>>>
>>>>>> 2. Suspend the device
>>>>>>
>>>>>>        # dmsetup suspend eradev
>>>>>>
>>>>>> 3. Load new table to device, e.g., to resize the device. Note, that, we
>>>>>>       must load the new table _after_ suspending the device to ensure the
>>>>>>       constructor of the new target instance reads up-to-date metadata, as
>>>>>>       committed by the post-suspend hook of dm-era.
>>>>>>
>>>>>>        # dmsetup load eradev --table "0 2097152 era /dev/datavg/erameta /dev/datavg/eradata 8192"
>>>>>>
>>>>>> 4. Device now has LIVE and INACTIVE tables
>>>>>>
>>>>>>        # dmsetup info eradev
>>>>>>        Name:              eradev
>>>>>>        State:             SUSPENDED
>>>>>>        Read Ahead:        16384
>>>>>>        Tables present:    LIVE & INACTIVE
>>>>>>        Open count:        0
>>>>>>        Event number:      0
>>>>>>        Major, minor:      252, 2
>>>>>>        Number of targets: 1
>>>>>>
>>>>>> 5. Retrieve the status of the device. This blocks because the device is
>>>>>>       suspended. Equivalently, any 'dmsetup message' operation would block
>>>>>>       too. This command holds the SRCU read lock on md->io_barrier.
>>>>>>
>>>>>>        # dmsetup status eradev
>>>>>
>>>>> I'll have a look at this flow, it seems to me we shouldn't stack up
>>>>> 'dmsetup status' and 'dmsetup message' commands if the table is
>>>>> suspended.
>>>>>
>>>>> I think it is unique to dm-era that you don't allow to _read_ metadata
>>>>> operations while a device is suspended.  But messages really shouldn't
>>>>> be sent when the device is suspended.  As-is DM is pretty silently
>>>>> cutthroat about that constraint.
>>>>>
>>>>> Resulting in deadlock is obviously cutthroat...
>>>>>
>>>>
>>>> Hi Mike,
>>>>
>>>> Thanks for the quick reply.
>>>>
>>>> I couldn't find this constraint documented anywhere and since the
>>>> various DM targets seem to allow message operations while the device is
>>>> suspended I drew the wrong conclusion.
>>>>
>>>> Thanks for clarifying this.
>>>>
>>>>>> 6. Resume the device. The resume operation tries to swap the old table
>>>>>>       with the new one and deadlocks, because it synchronizes SRCU for the
>>>>>>       old table, while the blocked 'dmsetup status' holds the SRCU read
>>>>>>       lock. And the old table is never resumed again at this point.
>>>>>>
>>>>>>        # dmsetup resume eradev
>>>>>>
>>>>>> 7. The relevant dmesg logs are:
>>>>>>
>>>>>> [ 7093.345486] dm-2: detected capacity change from 1048576 to 2097152
>>>>>> [ 7250.875665] INFO: task dmsetup:1986 blocked for more than 120 seconds.
>>>>>> [ 7250.875722]       Not tainted 5.16.0-rc2-release+ #16
>>>>>> [ 7250.875756] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>>>>>> [ 7250.875803] task:dmsetup         state:D stack:    0 pid: 1986 ppid:  1313 flags:0x00000000
>>>>>> [ 7250.875809] Call Trace:
>>>>>> [ 7250.875812]  <TASK>
>>>>>> [ 7250.875816]  __schedule+0x330/0x8b0
>>>>>> [ 7250.875827]  schedule+0x4e/0xc0
>>>>>> [ 7250.875831]  schedule_timeout+0x20f/0x2e0
>>>>>> [ 7250.875836]  ? do_set_pte+0xb8/0x120
>>>>>> [ 7250.875843]  ? prep_new_page+0x91/0xa0
>>>>>> [ 7250.875847]  wait_for_completion+0x8c/0xf0
>>>>>> [ 7250.875854]  perform_rpc+0x95/0xb0 [dm_era]
>>>>>> [ 7250.875862]  in_worker1.constprop.20+0x48/0x70 [dm_era]
>>>>>> [ 7250.875867]  ? era_iterate_devices+0x30/0x30 [dm_era]
>>>>>> [ 7250.875872]  ? era_status+0x64/0x1e0 [dm_era]
>>>>>> [ 7250.875877]  era_status+0x64/0x1e0 [dm_era]
>>>>>> [ 7250.875882]  ? dm_get_live_or_inactive_table.isra.11+0x20/0x20 [dm_mod]
>>>>>> [ 7250.875900]  ? __mod_node_page_state+0x82/0xc0
>>>>>> [ 7250.875909]  retrieve_status+0xbc/0x1e0 [dm_mod]
>>>>>> [ 7250.875921]  ? dm_get_live_or_inactive_table.isra.11+0x20/0x20 [dm_mod]
>>>>>> [ 7250.875932]  table_status+0x61/0xa0 [dm_mod]
>>>>>> [ 7250.875942]  ctl_ioctl+0x1b5/0x4f0 [dm_mod]
>>>>>> [ 7250.875956]  dm_ctl_ioctl+0xa/0x10 [dm_mod]
>>>>>> [ 7250.875966]  __x64_sys_ioctl+0x8e/0xd0
>>>>>> [ 7250.875970]  do_syscall_64+0x3a/0xd0
>>>>>> [ 7250.875974]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>>>> [ 7250.875980] RIP: 0033:0x7f20b7cd4017
>>>>>> [ 7250.875984] RSP: 002b:00007ffd443874b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>>>>>> [ 7250.875988] RAX: ffffffffffffffda RBX: 000055d69d6bd0e0 RCX: 00007f20b7cd4017
>>>>>> [ 7250.875991] RDX: 000055d69d6bd0e0 RSI: 00000000c138fd0c RDI: 0000000000000003
>>>>>> [ 7250.875993] RBP: 000000000000001e R08: 00007f20b81df648 R09: 00007ffd44387320
>>>>>> [ 7250.875996] R10: 00007f20b81deb53 R11: 0000000000000246 R12: 000055d69d6bd110
>>>>>> [ 7250.875998] R13: 00007f20b81deb53 R14: 000055d69d6bd000 R15: 0000000000000000
>>>>>> [ 7250.876002]  </TASK>
>>>>>> [ 7250.876004] INFO: task dmsetup:1987 blocked for more than 120 seconds.
>>>>>> [ 7250.876046]       Not tainted 5.16.0-rc2-release+ #16
>>>>>> [ 7250.876083] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>>>>>> [ 7250.876129] task:dmsetup         state:D stack:    0 pid: 1987 ppid:  1385 flags:0x00000000
>>>>>> [ 7250.876134] Call Trace:
>>>>>> [ 7250.876136]  <TASK>
>>>>>> [ 7250.876138]  __schedule+0x330/0x8b0
>>>>>> [ 7250.876142]  schedule+0x4e/0xc0
>>>>>> [ 7250.876145]  schedule_timeout+0x20f/0x2e0
>>>>>> [ 7250.876149]  ? __queue_work+0x226/0x420
>>>>>> [ 7250.876156]  wait_for_completion+0x8c/0xf0
>>>>>> [ 7250.876160]  __synchronize_srcu.part.19+0x92/0xc0
>>>>>> [ 7250.876167]  ? __bpf_trace_rcu_stall_warning+0x10/0x10
>>>>>> [ 7250.876173]  ? dm_swap_table+0x2f4/0x310 [dm_mod]
>>>>>> [ 7250.876185]  dm_swap_table+0x2f4/0x310 [dm_mod]
>>>>>> [ 7250.876198]  ? table_load+0x360/0x360 [dm_mod]
>>>>>> [ 7250.876207]  dev_suspend+0x95/0x250 [dm_mod]
>>>>>> [ 7250.876217]  ctl_ioctl+0x1b5/0x4f0 [dm_mod]
>>>>>> [ 7250.876231]  dm_ctl_ioctl+0xa/0x10 [dm_mod]
>>>>>> [ 7250.876240]  __x64_sys_ioctl+0x8e/0xd0
>>>>>> [ 7250.876244]  do_syscall_64+0x3a/0xd0
>>>>>> [ 7250.876247]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>>>> [ 7250.876252] RIP: 0033:0x7f15e9254017
>>>>>> [ 7250.876254] RSP: 002b:00007ffffdc59458 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>>>>>> [ 7250.876257] RAX: ffffffffffffffda RBX: 000055d4d99560e0 RCX: 00007f15e9254017
>>>>>> [ 7250.876260] RDX: 000055d4d99560e0 RSI: 00000000c138fd06 RDI: 0000000000000003
>>>>>> [ 7250.876261] RBP: 000000000000000f R08: 00007f15e975f648 R09: 00007ffffdc592c0
>>>>>> [ 7250.876263] R10: 00007f15e975eb53 R11: 0000000000000246 R12: 000055d4d9956110
>>>>>> [ 7250.876265] R13: 00007f15e975eb53 R14: 000055d4d9956000 R15: 0000000000000001
>>>>>> [ 7250.876269]  </TASK>
>>>>>>
>>>>>> Fix this by allowing metadata operations triggered by user space to run
>>>>>> in the corresponding user space thread, instead of queueing them for
>>>>>> execution by the dm-era worker thread.
>>>>>
>>>>> Allowing them to run while the device is suspended is _not_ the
>>>>> correct way to work-around this deadlock situation.  I think it'd be
>>>>> useful to understand why your userspace is tools are allowing these
>>>>> messages and status to a device that is suspended.
>>>>>
>>>>
>>>> Ack.
>>>>
>>>> The sequence of operations I provided is just a way to easily reproduce
>>>> the deadlock. The exact issue I am facing is the following:
>>>>
>>>> 1. Create device with dm-era target
>>>>
>>>>       # dmsetup create eradev --table "0 1048576 era /dev/datavg/erameta /dev/datavg/eradata 8192"
>>>>
>>>> 2. Load new table to device, e.g., to resize the device or snapshot it.
>>>>
>>>>       # dmsetup load eradev --table "0 2097152 era /dev/datavg/erameta /dev/datavg/eradata 8192"
>>>>
>>>> 3. Suspend the device
>>>>
>>>>       # dmsetup suspend eradev
>>>>
>>>> 4. Someone else, e.g., a user or a monitoring daemon, runs an LVM
>>>>      command at this point, e.g. 'vgs'.
>>>>
>>>> 5. 'vgs' tries to retrieve the status of the dm-era device using the
>>>>      DM_TABLE_STATUS ioctl, and blocks, because the command is queued for
>>>>      execution by the worker thread, which is suspended while the device
>>>>      is suspended.
>>>>
>>>>      Note, that, LVM uses the DM_NOFLUSH_FLAG, but this doesn't make a
>>>>      difference for dm-era, since the "problem" is not that it writes to
>>>>      the metadata, but that it queues the metadata read operation to the
>>>>      worker thread.
>>>>
>>>> 6. Resume the device: This deadlocks.
>>>>
>>>>       # dmsetup resume eradev
>>>>
>>>> So, I am not the one retrieving the status of the suspended device. LVM
>>>> is. LVM, when running commands like 'lvs' and 'vgs', retrieves the
>>>> status of the devices on the system using the DM_TABLE_STATUS ioctl.
>>>>
>>>> The deadlock is a race that happens when someone runs an LVM command at
>>>> the "wrong" time.
>>>
>>> I think dm-era shouldn't be disallowing work items while suspended,
>>> e.g.:
>>>
>>> diff --git a/drivers/md/dm-era-target.c b/drivers/md/dm-era-target.c
>>> index e92c1afc3677..33ea2c2374c7 100644
>>> --- a/drivers/md/dm-era-target.c
>>> +++ b/drivers/md/dm-era-target.c
>>> @@ -1175,7 +1175,6 @@ struct era {
>>>    	struct list_head rpc_calls;
>>>    	struct digest digest;
>>> -	atomic_t suspended;
>>>    };
>>>    struct rpc {
>>> @@ -1219,8 +1218,7 @@ static void remap_to_origin(struct era *era, struct bio *bio)
>>>     *--------------------------------------------------------------*/
>>>    static void wake_worker(struct era *era)
>>>    {
>>> -	if (!atomic_read(&era->suspended))
>>> -		queue_work(era->wq, &era->worker);
>>> +	queue_work(era->wq, &era->worker);
>>>    }
>>>    static void process_old_eras(struct era *era)
>>> @@ -1392,17 +1390,6 @@ static int in_worker1(struct era *era,
>>>    	return perform_rpc(era, &rpc);
>>>    }
>>> -static void start_worker(struct era *era)
>>> -{
>>> -	atomic_set(&era->suspended, 0);
>>> -}
>>> -
>>> -static void stop_worker(struct era *era)
>>> -{
>>> -	atomic_set(&era->suspended, 1);
>>> -	drain_workqueue(era->wq);
>>> -}
>>> -
>>>    /*----------------------------------------------------------------
>>>     * Target methods
>>>     *--------------------------------------------------------------*/
>>> @@ -1569,7 +1556,7 @@ static void era_postsuspend(struct dm_target *ti)
>>>    		/* FIXME: fail mode */
>>>    	}
>>> -	stop_worker(era);
>>> +	drain_workqueue(era->wq);
>>>    	r = metadata_commit(era->md);
>>>    	if (r) {
>>> @@ -1600,8 +1587,6 @@ static int era_preresume(struct dm_target *ti)
>>>    		era->nr_blocks = new_size;
>>>    	}
>>> -	start_worker(era);
>>> -
>>>    	r = in_worker0(era, metadata_era_rollover);
>>>    	if (r) {
>>>    		DMERR("%s: metadata_era_rollover failed", __func__);
>>>
>>> During suspend it should certainly flush all works; but I fail to see
>>> the value in disallowing the targets main way to do work (even while
>>> suspended). Maybe Joe has insight on why dm-era was written this way.
>>>
>>> But as an example dm-cache and dm-thin don't have such a strong
>>> restriction.
>>>
>>
>> The worker thread does the following:
>> 1. Process old eras, i.e., digest the archived writesets in to the main
>>     era array.
>>
>>     This doesn't involve a metadata commit, but writes to the metadata
>>
>> 2. Process deferred bios. This might trigger a metadata commit in
>>     general, but when the device is suspended no bios should be reaching
>>     the target, so it should be a no op.
>>
>> 3. Process RPC calls. This involves 'status' and 'message' operations.
>>     process_rpc_calls() does commit the metadata, after running all RPC
>>     calls. Checking if the device is suspended here is a way to prevent
>>     the metadata commit.
>>
>>     But, some of the 'message' operations also commit the metadata, e.g.,
>>     the metadata_take_snap message. I understand that no one should be
>>     sending messages to a suspended device, but it's not enforced so it
>>     could happen.
>>
>> I believe the value of suspending the worker when the device is
>> suspended is to prevent anyone from writing to the metadata.
>>
>> Writing to the metadata, while the device is suspended, could cause
>> problems. More on that in the following comments.
>>
>>>> Using an appropriate LVM 'global_filter' is a way to prevent this, but:
>>>>
>>>> 1. This is just a workaround, not a proper solution.
>>>> 2. This is not always an option. Imagine someone running an LVM command
>>>>      in a container, for example. Or, we may not be allowed to change the
>>>>      LVM configuration of the host at all.
>>>>
>>>>> FYI, status shouldn't trigger write IOs if the device is suspended.
>>>>> Both dm-cache and dm-thin have this in status as a guard around its
>>>>> work to ensure updated accounting (as a side-effect of committing
>>>>> metadata), e.g.:
>>>>>
>>>>>                    /* Commit to ensure statistics aren't out-of-date */
>>>>>                    if (!(status_flags & DM_STATUS_NOFLUSH_FLAG) && !dm_suspended(ti))
>>>>>                            (void) commit(cache, false);
>>>>
>>>> Ack. The current behavior of dm-era wrt 'status' command is:
>>>>
>>>> 1. Queue the 'metadata_get_stats()' function for execution by the worker
>>>>      thread.
>>>> 2. The worker runs the function and retrieves the statistics
>>>> 3. The worker commits the metadata _after_ retrieving the statistics
>>>>
>>>> Shall I just change 'era_status()' to read the metadata directly and
>>>> skip the metadata commit, instead of queuing the operation to the worker
>>>> thread, when the device is suspended?
>>>
>>> dm-era should still respect that the device is suspended (disallow
>>> metadata commits, etc).
>>>
>>> Probably should just do like the dm-cache code I quoted above (dm-thin
>>> does the same): do not commit if suspended.
>>>
>>> Seems to me that if simply retrieving stats in era_status() results in
>>> metadata commit as a side-effect of its work that is pretty bogus --
>>> process_rpc_calls() must be what does it just due to generic code?
>>>
>>> If so, yes absolutely avoid that metadata commit (might we just update
>>> process_rpc_calls() to check dm_suspended()?)
>>>
>>
>> Yes, the metadata commit is due to the generic code in
>> process_rpc_calls(), and could be avoided if we check the device
>> suspended state here.
>>
>> But, avoiding the metadata commit when the device is suspended is not
>> enough. No one should be writing to the metadata at all.
>>
>> Else, we risk hitting the bug fixed by commit 9ae6e8b1c9bbf6 ("dm era:
>> commit metadata in postsuspend after worker stops").
>>
>> In short, writing to the metadata of a suspended dm-era device results
>> in the committed metadata getting out-of-sync with the in-core metadata.
>>
>> This could result in the corruption of the on-disk metadata if we load a
>> new dm-era table to the device, and destroy the old one (the destructor
>> flushes any cached writes to the disk).
>>
>> For an exact sequence of events that can lead to this issue, please see
>> the commit mentioned above (9ae6e8b1c9bbf6).
>>
>>> Sorry for such fundamental concerns, I really should've caught this
>>> stuff back when dm-era was introduced!
>>>
>>> Really does feel like a read-write lock for metadata might be
>>> warranted.
>>>
>>>> I think we would still need a lock to synchronize access to the
>>>> metadata, since, if I am not mistaken, the pre-resume hook that starts
>>>> the worker runs before clearing the DMF_SUSPENDED flag, and can run
>>>> concurrently with the 'status' IOCTL. So, the worker might run
>>>> concurrently with a 'status' operation that sees the device as
>>>> suspended.
>>>
>>> I was initially thinking removing dm-era's suspended state (like above
>>> patch) should take care of the pitfalls of disallowing works due to
>>> that state.
>>>
>>> But the dm-era could should be audited to make sure the big hammer of
>>> disallowing works while suspended wasn't important for its
>>> implementation (and the need to disallow device changes while
>>> suspended).
>>>
>>
>> I think a simple solution, without modifying dm-era too much, is:
>> 1. Have status run in the user space thread, instead of queueing it to
>>     the worker.
> 
> OK.
> 
>> 2. Add a mutex to avoid status running concurrently with the worker
>>     thread.
> 
> Ideally you'd already have adequate protection.
> You want to be sure you're protecting data and not just user vs worker.
> 

I agree. Ideally we would use a read-write lock to protect access to the
metadata, like the rest of the DM targets do.

I proposed this locking scheme because it's really simple, and it
doesn't require many changes. I agree it's not ideal, but it could be a
first step, before introducing a more fine grained read-write lock.

>> 3. Have status check if the device is suspended. If it is not, commit
>>     the metadata before retrieving the status. If it is, skip the
>>     metadata commit. This is in line with what the thin and cache targets
>>     do.
>>
>> Doing this avoids the deadlock in case someone, e.g., an LVM command,
>> runs a status operation against a suspended dm-era device.
>>
>> User space could trigger the deadlock if it sends a message to a
>> suspended dm-era device, but, since this should never happen, it
>> shouldn't affect existing workflows.
> 
> Why not have message run from user thread too?
> 

That's what this patch does, but I thought it was not the correct way to
solve the issue, that's why I didn't propose it again:

> Allowing them to run while the device is suspended is _not_ the
> correct way to work-around this deadlock situation.

But, probably, I misunderstood something.

Allowing message operations to run in the user thread, while the device
is suspended, would result in writing to the metadata of the suspended
device.

I understand that this should not happen.

We could fail message operations if the device is suspended (since all
of them write to the metadata), but isn't this considered a change to
the user facing API?

What if someone depends on the existing behavior of message operations
blocking if the dm-era device is suspended? Is it ok to change this
behavior?

>> Still, it might be a good idea to enforce this restriction, i.e.,
>> disallow running message operations on suspended devices, but, I guess
>> this requires more discussion.
> 
> It's all target specific. DM core shouldn't be the place to impose
> this constraint.
> 

Ack.

Nikos

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

