Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4296B43C5C6
	for <lists+dm-devel@lfdr.de>; Wed, 27 Oct 2021 10:56:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-Gu0WuAuINOmd_qvWKHBrQw-1; Wed, 27 Oct 2021 04:56:51 -0400
X-MC-Unique: Gu0WuAuINOmd_qvWKHBrQw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B1DF802B78;
	Wed, 27 Oct 2021 08:56:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FD9A1981F;
	Wed, 27 Oct 2021 08:56:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D6201800FDD;
	Wed, 27 Oct 2021 08:56:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19R8uOMX025327 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 Oct 2021 04:56:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 04E6740D1B9E; Wed, 27 Oct 2021 08:56:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00A5A40D1B9D
	for <dm-devel@redhat.com>; Wed, 27 Oct 2021 08:56:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD61A180F6EE
	for <dm-devel@redhat.com>; Wed, 27 Oct 2021 08:56:23 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
	[185.176.79.56]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-530-UCuwCKxnNjSnL0rUsZ-ygg-1; Wed, 27 Oct 2021 04:56:20 -0400
X-MC-Unique: UCuwCKxnNjSnL0rUsZ-ygg-1
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4HfMsW49s4z67lnr;
	Wed, 27 Oct 2021 16:53:03 +0800 (CST)
Received: from fraeml714-chm.china.huawei.com (10.206.15.33) by
	fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2308.15; Wed, 27 Oct 2021 10:56:17 +0200
Received: from fraeml714-chm.china.huawei.com ([10.206.15.33]) by
	fraeml714-chm.china.huawei.com ([10.206.15.33]) with mapi id
	15.01.2308.015; Wed, 27 Oct 2021 10:56:17 +0200
From: Roberto Sassu <roberto.sassu@huawei.com>
To: Deven Bowers <deven.desai@linux.microsoft.com>, "corbet@lwn.net"
	<corbet@lwn.net>, "axboe@kernel.dk" <axboe@kernel.dk>, "agk@redhat.com"
	<agk@redhat.com>, "snitzer@redhat.com" <snitzer@redhat.com>,
	"ebiggers@kernel.org" <ebiggers@kernel.org>,
	"tytso@mit.edu" <tytso@mit.edu>,
	"paul@paul-moore.com" <paul@paul-moore.com>, "eparis@redhat.com"
	<eparis@redhat.com>, "jmorris@namei.org" <jmorris@namei.org>,
	"serge@hallyn.com" <serge@hallyn.com>
Thread-Topic: [RFC PATCH v7 05/16] ipe: add LSM hooks on execution and kernel
	read
Thread-Index: AQHXwGWOuRcjToK/XkWwstEqYzOChavjssvQgAHjQYCAAQnVkA==
Date: Wed, 27 Oct 2021 08:56:17 +0000
Message-ID: <150763b55a6f48b78e73d91442a9aa7e@huawei.com>
References: <1634151995-16266-1-git-send-email-deven.desai@linux.microsoft.com>
	<1634151995-16266-6-git-send-email-deven.desai@linux.microsoft.com>
	<d4f1875866f649fe9e24915159a71361@huawei.com>
	<1bc16f72-6793-2383-1874-a98f4e2b2691@linux.microsoft.com>
In-Reply-To: <1bc16f72-6793-2383-1874-a98f4e2b2691@linux.microsoft.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.221.98.153]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 19R8uOMX025327
X-loop: dm-devel@redhat.com
Cc: "linux-security-module@vger.kernel.org"
	<linux-security-module@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"jannh@google.com" <jannh@google.com>,
	"linux-fscrypt@vger.kernel.org" <linux-fscrypt@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH v7 05/16] ipe: add LSM hooks on execution
 and kernel read
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> From: Deven Bowers [mailto:deven.desai@linux.microsoft.com]
> Sent: Tuesday, October 26, 2021 9:04 PM
> On 10/25/2021 5:22 AM, Roberto Sassu wrote:
> >> From:deven.desai@linux.microsoft.com
> >> [mailto:deven.desai@linux.microsoft.com]
> >> From: Deven Bowers<deven.desai@linux.microsoft.com>
> >>
> >> IPE's initial goal is to control both execution and the loading of
> >> kernel modules based on the system's definition of trust. It
> >> accomplishes this by plugging into the security hooks for execve,
> >> mprotect, mmap, kernel_load_data and kernel_read_data.
> >>
> >> Signed-off-by: Deven Bowers<deven.desai@linux.microsoft.com>
> >> ---
> >>
> >> Relevant changes since v6:
> >>    * Split up patch 02/12 into four parts:
> >>        1. context creation [01/16]
> >>        2. audit [07/16]
> >>        3. evaluation loop [03/16]
> >>        4. access control hooks [05/16] (this patch)
> >>
> >> ---
> >>   security/ipe/hooks.c  | 149
> ++++++++++++++++++++++++++++++++++++++++++
> >>   security/ipe/hooks.h  |  23 ++++++-
> >>   security/ipe/ipe.c    |   5 ++
> >>   security/ipe/policy.c |  23 +++++++
> >>   security/ipe/policy.h |  12 +++-
> >>   5 files changed, 209 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/security/ipe/hooks.c b/security/ipe/hooks.c
> >> index ed0c886eaa5a..216242408a80 100644
> >> --- a/security/ipe/hooks.c
> >> +++ b/security/ipe/hooks.c
> >> @@ -6,11 +6,15 @@
> >>   #include "ipe.h"
> >>   #include "ctx.h"
> >>   #include "hooks.h"
> >> +#include "eval.h"
> >>
> >> +#include <linux/fs.h>
> >>   #include <linux/sched.h>
> >>   #include <linux/types.h>
> >>   #include <linux/refcount.h>
> >>   #include <linux/rcupdate.h>
> >> +#include <linux/binfmts.h>
> >> +#include <linux/mman.h>
> >>
> >>   /**
> >>    * ipe_task_alloc: Assign a new context for an associated task structure.
> >> @@ -56,3 +60,148 @@ void ipe_task_free(struct task_struct *task)
> >>   	ipe_put_ctx(ctx);
> >>   	rcu_read_unlock();
> >>   }
> >> +
> >> +/**
> >> + * ipe_on_exec: LSM hook called when a process is loaded through the exec
> >> + *		family of system calls.
> >> + * @bprm: Supplies a pointer to a linux_binprm structure to source the file
> >> + *	  being evaluated.
> >> + *
> >> + * Return:
> >> + * 0 - OK
> >> + * !0 - Error
> >> + */
> >> +int ipe_on_exec(struct linux_binprm *bprm)
> >> +{
> >> +	return ipe_process_event(bprm->file, ipe_operation_exec,
> >> ipe_hook_exec);
> >> +}
> >> +
> >> +/**
> >> + * ipe_on_mmap: LSM hook called when a file is loaded through the mmap
> >> + *		family of system calls.
> >> + * @f: File being mmap'd. Can be NULL in the case of anonymous memory.
> >> + * @reqprot: The requested protection on the mmap, passed from
> usermode.
> >> + * @prot: The effective protection on the mmap, resolved from reqprot and
> >> + *	  system configuration.
> >> + * @flags: Unused.
> >> + *
> >> + * Return:
> >> + * 0 - OK
> >> + * !0 - Error
> >> + */
> >> +int ipe_on_mmap(struct file *f, unsigned long reqprot, unsigned long prot,
> >> +		unsigned long flags)
> >> +{
> >> +	if (prot & PROT_EXEC || reqprot & PROT_EXEC)
> >> +		return ipe_process_event(f, ipe_operation_exec,
> >> ipe_hook_mmap);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +/**
> >> + * ipe_on_mprotect: LSM hook called when a mmap'd region of memory is
> >> changing
> >> + *		    its protections via mprotect.
> >> + * @vma: Existing virtual memory area created by mmap or similar
> >> + * @reqprot: The requested protection on the mmap, passed from
> usermode.
> >> + * @prot: The effective protection on the mmap, resolved from reqprot and
> >> + *	  system configuration.
> >> + *
> >> + * Return:
> >> + * 0 - OK
> >> + * !0 - Error
> >> + */
> >> +int ipe_on_mprotect(struct vm_area_struct *vma, unsigned long reqprot,
> >> +		    unsigned long prot)
> >> +{
> >> +	/* Already Executable */
> >> +	if (vma->vm_flags & VM_EXEC)
> >> +		return 0;
> >> +
> >> +	if (((prot & PROT_EXEC) || reqprot & PROT_EXEC))
> >> +		return ipe_process_event(vma->vm_file, ipe_operation_exec,
> >> +					 ipe_hook_mprotect);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +/**
> >> + * ipe_on_kernel_read: LSM hook called when a file is being read in from
> >> + *		       disk.
> >> + * @file: Supplies a pointer to the file structure being read in from disk
> >> + * @id: Supplies the enumeration identifying the purpose of the read.
> >> + * @contents: Unused.
> >> + *
> >> + * Return:
> >> + * 0 - OK
> >> + * !0 - Error
> >> + */
> >> +int ipe_on_kernel_read(struct file *file, enum kernel_read_file_id id,
> >> +		       bool contents)
> >> +{
> >> +	enum ipe_operation op;
> >> +
> >> +	switch (id) {
> >> +	case READING_FIRMWARE:
> >> +		op = ipe_operation_firmware;
> >> +		break;
> >> +	case READING_MODULE:
> >> +		op = ipe_operation_kernel_module;
> >> +		break;
> >> +	case READING_KEXEC_INITRAMFS:
> >> +		op = ipe_operation_kexec_initramfs;
> >> +		break;
> >> +	case READING_KEXEC_IMAGE:
> >> +		op = ipe_operation_kexec_image;
> >> +		break;
> >> +	case READING_POLICY:
> >> +		op = ipe_operation_ima_policy;
> >> +		break;
> >> +	case READING_X509_CERTIFICATE:
> >> +		op = ipe_operation_ima_x509;
> >> +		break;
> >> +	default:
> >> +		op = ipe_operation_max;
> > Possible problem here. If someone (like me) adds a new file type
> > and forgets to add a case, there will be an out of bound access
> > in evaluate():
> >
> >          rules = &pol->parsed->rules[ctx->op];
> >
> > due to the static definition of the rules array in the ipe_parsed_policy
> > structure (array length: ipe_operation_max).
> 
> Yeah, that's a problem. I can fix this down in the eval loop by matching
> the global default and emitting a WARN here.

Ok, will do a test with your new version of the patch set.

Thanks

Roberto

HUAWEI TECHNOLOGIES Duesseldorf GmbH, HRB 56063
Managing Director: Li Peng, Zhong Ronghua

> > Roberto
> >
> > HUAWEI TECHNOLOGIES Duesseldorf GmbH, HRB 56063
> > Managing Director: Li Peng, Zhong Ronghua
> >
> >> +	}
> >> +
> >> +	return ipe_process_event(file, op, ipe_hook_kernel_read);
> >> +}
> >> +
> >> +/**
> >> + * ipe_on_kernel_load_data: LSM hook called when a buffer is being read in
> >> from
> >> + *			    disk.
> >> + * @id: Supplies the enumeration identifying the purpose of the read.
> >> + * @contents: Unused.
> >> + *
> >> + * Return:
> >> + * 0 - OK
> >> + * !0 - Error
> >> + */
> >> +int ipe_on_kernel_load_data(enum kernel_load_data_id id, bool contents)
> >> +{
> >> +	enum ipe_operation op;
> >> +
> >> +	switch (id) {
> >> +	case LOADING_FIRMWARE:
> >> +		op = ipe_operation_firmware;
> >> +		break;
> >> +	case LOADING_MODULE:
> >> +		op = ipe_operation_kernel_module;
> >> +		break;
> >> +	case LOADING_KEXEC_INITRAMFS:
> >> +		op = ipe_operation_kexec_initramfs;
> >> +		break;
> >> +	case LOADING_KEXEC_IMAGE:
> >> +		op = ipe_operation_kexec_image;
> >> +		break;
> >> +	case LOADING_POLICY:
> >> +		op = ipe_operation_ima_policy;
> >> +		break;
> >> +	case LOADING_X509_CERTIFICATE:
> >> +		op = ipe_operation_ima_x509;
> >> +		break;
> >> +	default:
> >> +		op = ipe_operation_max;
> >> +	}
> >> +
> >> +	return ipe_process_event(NULL, op, ipe_hook_kernel_load);
> >> +}
> >> diff --git a/security/ipe/hooks.h b/security/ipe/hooks.h
> >> index 58ed4a612e26..c99a0b7f45f7 100644
> >> --- a/security/ipe/hooks.h
> >> +++ b/security/ipe/hooks.h
> >> @@ -5,11 +5,19 @@
> >>   #ifndef IPE_HOOKS_H
> >>   #define IPE_HOOKS_H
> >>
> >> +#include <linux/fs.h>
> >>   #include <linux/types.h>
> >>   #include <linux/sched.h>
> >> +#include <linux/binfmts.h>
> >> +#include <linux/security.h>
> >>
> >>   enum ipe_hook {
> >> -	ipe_hook_max = 0
> >> +	ipe_hook_exec = 0,
> >> +	ipe_hook_mmap,
> >> +	ipe_hook_mprotect,
> >> +	ipe_hook_kernel_read,
> >> +	ipe_hook_kernel_load,
> >> +	ipe_hook_max
> >>   };
> >>
> >>   int ipe_task_alloc(struct task_struct *task,
> >> @@ -17,4 +25,17 @@ int ipe_task_alloc(struct task_struct *task,
> >>
> >>   void ipe_task_free(struct task_struct *task);
> >>
> >> +int ipe_on_exec(struct linux_binprm *bprm);
> >> +
> >> +int ipe_on_mmap(struct file *f, unsigned long reqprot, unsigned long prot,
> >> +		unsigned long flags);
> >> +
> >> +int ipe_on_mprotect(struct vm_area_struct *vma, unsigned long reqprot,
> >> +		    unsigned long prot);
> >> +
> >> +int ipe_on_kernel_read(struct file *file, enum kernel_read_file_id id,
> >> +		       bool contents);
> >> +
> >> +int ipe_on_kernel_load_data(enum kernel_load_data_id id, bool contents);
> >> +
> >>   #endif /* IPE_HOOKS_H */
> >> diff --git a/security/ipe/ipe.c b/security/ipe/ipe.c
> >> index b58b372327a1..3f9d43783293 100644
> >> --- a/security/ipe/ipe.c
> >> +++ b/security/ipe/ipe.c
> >> @@ -25,6 +25,11 @@ struct lsm_blob_sizes ipe_blobs __lsm_ro_after_init =
> {
> >>   static struct security_hook_list ipe_hooks[] __lsm_ro_after_init = {
> >>   	LSM_HOOK_INIT(task_alloc, ipe_task_alloc),
> >>   	LSM_HOOK_INIT(task_free, ipe_task_free),
> >> +	LSM_HOOK_INIT(bprm_check_security, ipe_on_exec),
> >> +	LSM_HOOK_INIT(mmap_file, ipe_on_mmap),
> >> +	LSM_HOOK_INIT(file_mprotect, ipe_on_mprotect),
> >> +	LSM_HOOK_INIT(kernel_read_file, ipe_on_kernel_read),
> >> +	LSM_HOOK_INIT(kernel_load_data, ipe_on_kernel_load_data),
> >>   };
> >>
> >>   /**
> >> diff --git a/security/ipe/policy.c b/security/ipe/policy.c
> >> index b766824cc08f..048500229365 100644
> >> --- a/security/ipe/policy.c
> >> +++ b/security/ipe/policy.c
> >> @@ -483,6 +483,14 @@ int ipe_parse_op(const struct ipe_policy_token
> *tok,
> >>   {
> >>   	substring_t match[MAX_OPT_ARGS] = { 0 };
> >>   	const match_table_t ops = {
> >> +		{ ipe_operation_exec,		 "EXECUTE" },
> >> +		{ ipe_operation_firmware,	 "FIRMWARE" },
> >> +		{ ipe_operation_kernel_module,	 "KMODULE" },
> >> +		{ ipe_operation_kexec_image,	 "KEXEC_IMAGE" },
> >> +		{ ipe_operation_kexec_initramfs, "KEXEC_INITRAMFS"},
> >> +		{ ipe_operation_ima_policy,	 "IMA_POLICY" },
> >> +		{ ipe_operation_ima_x509,	 "IMA_X509_CERT" },
> >> +		{ ipe_op_alias_kernel_read,	 "KERNEL_READ" },
> >>   		{ ipe_op_alias_max, NULL },
> >>   	};
> >>
> >> @@ -838,6 +846,15 @@ static int parse_policy(struct ipe_policy *p)
> >>   	return rc;
> >>   }
> >>
> >> +static const enum ipe_operation alias_kread[] = {
> >> +	ipe_operation_firmware,
> >> +	ipe_operation_kernel_module,
> >> +	ipe_operation_ima_policy,
> >> +	ipe_operation_ima_x509,
> >> +	ipe_operation_kexec_image,
> >> +	ipe_operation_kexec_initramfs,
> >> +};
> >> +
> >>   /**
> >>    * ipe_is_op_alias: Determine if @op is an alias for one or more operations
> >>    * @op: Supplies the operation to check. Should be either ipe_operation or
> >> @@ -852,9 +869,15 @@ static int parse_policy(struct ipe_policy *p)
> >>   bool ipe_is_op_alias(int op, const enum ipe_operation **map, size_t *size)
> >>   {
> >>   	switch (op) {
> >> +	case ipe_op_alias_kernel_read:
> >> +		*map = alias_kread;
> >> +		*size = ARRAY_SIZE(alias_kread);
> >> +		break;
> >>   	default:
> >>   		return false;
> >>   	}
> >> +
> >> +	return true;
> >>   }
> >>
> >>   /**
> >> diff --git a/security/ipe/policy.h b/security/ipe/policy.h
> >> index 6818f6405dd0..ca37af46e5af 100644
> >> --- a/security/ipe/policy.h
> >> +++ b/security/ipe/policy.h
> >> @@ -26,7 +26,14 @@ struct ipe_policy_line {
> >>   struct ipe_module;
> >>
> >>   enum ipe_operation {
> >> -	ipe_operation_max = 0,
> >> +	ipe_operation_exec = 0,
> >> +	ipe_operation_firmware,
> >> +	ipe_operation_kernel_module,
> >> +	ipe_operation_kexec_image,
> >> +	ipe_operation_kexec_initramfs,
> >> +	ipe_operation_ima_policy,
> >> +	ipe_operation_ima_x509,
> >> +	ipe_operation_max
> >>   };
> >>
> >>   /*
> >> @@ -34,7 +41,8 @@ enum ipe_operation {
> >>    * that are just one or more operations under the hood
> >>    */
> >>   enum ipe_op_alias {
> >> -	ipe_op_alias_max = ipe_operation_max,
> >> +	ipe_op_alias_kernel_read = ipe_operation_max,
> >> +	ipe_op_alias_max,
> >>   };
> >>
> >>   enum ipe_action {
> >> --
> >> 2.33.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

