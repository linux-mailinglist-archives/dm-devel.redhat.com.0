Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8DC1A37F9
	for <lists+dm-devel@lfdr.de>; Thu,  9 Apr 2020 18:27:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586449655;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ey9FySgtgu4ZInosrrFbSaP+IXfw4958dQpt1+vX5ww=;
	b=NtXFAXNo2P3tyia6Jigom6m9gmnAtaOYL//4DRra+0vZRZo5OwA67j5jIWEcyGsJgBeqiu
	tzk7wEuAQUQlIraJTXzdiypmzNZxO0sftfzDQLqCBWBGIRNdNQmZzn2Rue2qKibIfLpyoo
	p8HuxZksAaHhMcI9iI+OcuP8MJuTm1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-aOQvPRQePyKypDOv8VvR1g-1; Thu, 09 Apr 2020 12:27:31 -0400
X-MC-Unique: aOQvPRQePyKypDOv8VvR1g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60704107B103;
	Thu,  9 Apr 2020 16:27:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4C57C0D9F;
	Thu,  9 Apr 2020 16:27:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EFCC193075;
	Thu,  9 Apr 2020 16:27:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 039GRJ2A011742 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Apr 2020 12:27:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F02271006B0F; Thu,  9 Apr 2020 16:27:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB25F1006B07
	for <dm-devel@redhat.com>; Thu,  9 Apr 2020 16:27:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E6EB800297
	for <dm-devel@redhat.com>; Thu,  9 Apr 2020 16:27:16 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-479-Rl4pGzw_MpWHRpiawcUPDA-1;
	Thu, 09 Apr 2020 12:27:11 -0400
X-MC-Unique: Rl4pGzw_MpWHRpiawcUPDA-1
Received: from [10.137.106.115] (unknown [131.107.174.243])
	by linux.microsoft.com (Postfix) with ESMTPSA id A0CB220B46F0;
	Thu,  9 Apr 2020 09:27:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A0CB220B46F0
From: Deven Bowers <deven.desai@linux.microsoft.com>
To: Jann Horn <jannh@google.com>
References: <20200406221439.1469862-1-deven.desai@linux.microsoft.com>
	<20200406221439.1469862-3-deven.desai@linux.microsoft.com>
	<CAG48ez3oT4PvLThTqyruoTaNuYRcM_-dy5Vtdpugk2-7zJ8bXw@mail.gmail.com>
Message-ID: <d827fa51-7047-0e4d-0d1e-6047ae8bcf13@linux.microsoft.com>
Date: Thu, 9 Apr 2020 09:27:09 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAG48ez3oT4PvLThTqyruoTaNuYRcM_-dy5Vtdpugk2-7zJ8bXw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 039GRJ2A011742
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Sasha Levin <sashal@kernel.org>,
	dm-devel@redhat.com, snitzer@redhat.com,
	kernel list <linux-kernel@vger.kernel.org>,
	Pavel Tatashin <pasha.tatashin@soleen.com>,
	James Morris <jmorris@namei.org>,
	Mimi Zohar <zohar@linux.ibm.com>, mdsakib@linux.microsoft.com,
	linux-block@vger.kernel.org, nramas@linux.microsoft.com,
	linux-security-module <linux-security-module@vger.kernel.org>,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org,
	jaskarankhurana@linux.microsoft.com, agk@redhat.com,
	"Serge E. Hallyn" <serge@hallyn.com>
Subject: Re: [dm-devel] [RFC PATCH v2 02/12] security: add ipe lsm
 evaluation loop and audit system
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit


On 4/7/2020 5:13 AM, Jann Horn wrote:
> On Tue, Apr 7, 2020 at 12:14 AM<deven.desai@linux.microsoft.com>  wrote:
>> Add the core logic of the IPE LSM, the evaluation loop (engine),
>> the audit system, and the skeleton of the policy structure.
> Here's a first review pass for this patch without really understanding
> your data structures yet:
>
> [...]
>> diff --git a/security/ipe/Kconfig b/security/ipe/Kconfig
>> new file mode 100644
>> index 000000000000..0c67cd049d0c
>> --- /dev/null
>> +++ b/security/ipe/Kconfig
>> @@ -0,0 +1,41 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# Integrity Policy Enforcement (IPE) configuration
>> +#
>> +
>> +menuconfig SECURITY_IPE
>> +       bool "Integrity Policy Enforcement (IPE)"
>> +       depends on SECURITY && AUDIT
>> +       select SYSTEM_DATA_VERIFICATION
>> +       help
>> +         This option enables the Integrity Policy Enforcement subsystem,
>> +         allowing systems to enforce integrity requirements on various
>> +         aspects of user-mode applications. These requirements are
>> +         controlled by a policy.
> This text is very generic and doesn't really make it clear how IPE is
> different from other LSMs; could you perhaps add some more text here
> on the parts of IPE that distinguish it from other LSMs?
>
> In the cover letter, you have this stuff at the top:
>
> """
> The type of system for which IPE is designed for use is an embedded device
> with a specific purpose (e.g. network firewall device in a data center),
> where all software and configuration is built and provisioned by the owner.
>
> Specifically, a system which leverages IPE is not intended for general
> purpose computing and does not utilize any software or configuration
> built by a third party. An ideal system to leverage IPE has both mutable
> and immutable components, however, all binary executable code is immutable.
>
> The scope of IPE is constrained to the OS. It is assumed that platform
> firmware verifies the the kernel and optionally the root filesystem (e.g.
> via U-Boot verified boot). IPE then utilizes LSM hooks to enforce a
> flexible, kernel-resident integrity verification policy.
>
> IPE differs from other LSMs which provide integrity checking (for instance,
> IMA), as it has no dependency on the filesystem metadata itself. The
> attributes that IPE checks are deterministic properties that exist solely
> in the kernel. Additionally, IPE provides no additional mechanisms of
> verifying these files (e.g. IMA Signatures) - all of the attributes of
> verifying files are existing features within the kernel, such as dm-verity
> or fsverity.
>
> IPE provides a policy that allows owners of the system to easily specify
> integrity requirements and uses dm-verity signatures to simplify the
> authentication of allowed objects like authorized code and data.
> """
>
> Perhaps you could add a summary of that here?
Sure, no problem. I'll add a bit more detail to the Kconfig in v3, 
something
like:

"""
This option enables the Integrity Policy Enforcement subsystem
allowing systems to enforce integrity requirements on user land
binaries. IPE differs from other LSMs by removing dependencies
on filesystem metadata, making its decisions based off of kernel-
resident features and data structures. A key feature of IPE is a
customizable policy to allow admins to reconfigure integrity
requirements on the fly.
"""
> [...]
>> diff --git a/security/ipe/ipe-audit.c b/security/ipe/ipe-audit.c
> [...]
>> +void ipe_audit_mode(void)
>> +{
>> +       struct audit_buffer *ab;
>> +
>> +       ab = audit_log_start(audit_context(), GFP_ATOMIC | __GFP_NOWARN,
>> +                            AUDIT_INTEGRITY_MODE);
> Why is this GFP_ATOMIC? ipe_audit_mode() is used from
> ipe_switch_mode(), which is allowed to sleep, right?

Yeah, that's a fair point. I had originally based _all_ of these audit
functions off of common_lsm_audit which utilizes these two flags.
We chose not to use that specific function for several reasons, but
there's no reason to keep these allocator flags. I'll move it to
GFP_KERNEL.
>> +       if (!ab)
>> +               return;
>> +
>> +       audit_log_format(ab, "IPE mode=%s", (enforce) ? IPE_MODE_ENFORCE :
>> +                                                       IPE_MODE_PERMISSIVE);
>> +
>> +       audit_log_end(ab);
>> +}
> [...]
>> +/**
>> + * ipe_audit_ignore_line: Emit a warning that the line was not understood by
>> + *                       IPE's parser and the line will be ignored and not
>> + *                       parsed.
>> + * @line_num: line number that is being ignored.
>> + */
>> +void ipe_audit_ignore_line(size_t i)
>> +{
>> +       pr_warn("failed to parse line number %zu, ignoring", i);
>> +}
> It seems a bit silly to have an extra method just for this?
Fair point. I wanted to collapse as much of the *common* user-facing 
strings
into one file, and I was trying to adhere to the 80-character limit.

I'll remove the function and inline it.
>> +/**
>> + * ipe_audit_policy_activation: Emit an audit event that a specific policy
>> + *                             was activated as the active policy.
>> + * @pol: policy that is being activated
>> + */
>> +void ipe_audit_policy_activation(const struct ipe_policy *pol)
>> +{
>> +       struct audit_buffer *ab;
>> +
>> +       ab = audit_log_start(audit_context(), GFP_ATOMIC | __GFP_NOWARN,
>> +                            AUDIT_INTEGRITY_POLICY_ACTIVATE);
> Again, this runs in sleepable context and GFP_ATOMIC is unnecessary, right?
Yep. I'll fix it in v3. Same with ipe_audit_policy_activation, below. 
The only one
that runs in non-sleepable context is ipe_audit_match.
>> +       if (!ab)
>> +               return;
>> +
>> +       audit_log_format(ab, POLICY_ACTIVATE_STR, pol->policy_name,
>> +                        pol->policy_version.major, pol->policy_version.minor,
>> +                        pol->policy_version.rev);
>> +
>> +       audit_log_end(ab);
>> +}
> [...]
>> diff --git a/security/ipe/ipe-engine.c b/security/ipe/ipe-engine.c
> [...]
>> +/**
>> + * get_audit_pathname: Return the absolute path of the file struct passed in
>> + * @file: file to derive an absolute path from.
>> + *
>> + * This function walks past chroots and mount points.
> [...]
>> + */
>> +static char *get_audit_pathname(const struct file *file)
>> +{
> [...]
>> +       sb = file->f_path.dentry->d_sb;
>> +
>> +       pathbuf = __getname();
>> +       if (!pathbuf) {
>> +               rc = -ENOMEM;
>> +               goto err;
>> +       }
>> +
>> +       pos = d_absolute_path(&file->f_path, pathbuf, PATH_MAX);
> Just as an FYI, no change required: d_absolute_path() will also
> succeed for files that are not contained within the filesystem root of
> the current process; in that case, you'll get stuff like paths rooted
> in a different mount namespace.
>
>> +       if (IS_ERR(pos)) {
>> +               rc = PTR_ERR(pos);
>> +               goto err;
>> +       }
>> +
>> +       temp_path = __getname();
>> +       if (!temp_path) {
>> +               rc = -ENOMEM;
>> +               goto err;
>> +       }
>> +
>> +       strlcpy(temp_path, pos, PATH_MAX);
>> +
>> +       if (pathbuf)
> This check seems superfluous.
I'll remove it.
>> +               __putname(pathbuf);
>> +
>> +       return temp_path;
>> +err:
>> +       if (pathbuf)
>> +               __putname(pathbuf);
>> +       if (temp_path)
>> +               __putname(temp_path);
>> +
>> +       return ERR_PTR(rc);
>> +}
> [...]
>> +/**
>> + * prealloc_cache: preallocate the cache tree for all ipe properties, so
>> + *                that this data maybe used later in the read side critical
> s/maybe/may be/
Thanks!
>> + *                section.
>> + * @ctx: Ipe engine context structure passed to the property prealloc function.
>> + * @cache: Root of the cache tree to insert nodes under.
>> + *
>> + * Return:
>> + * 0 - OK
>> + * -ENOMEM - Out of memory
>> + * Other - See individual property preallocator functions.
>> + */
>> +static int prealloc_cache(struct ipe_engine_ctx *ctx,
>> +                         struct rb_root *cache)
>> +{
>> +       int rc = 0;
>> +       struct rb_node *node;
>> +       struct ipe_prop_reg *reg;
>> +       struct ipe_prop_cache *storage;
>> +
>> +       for (node = rb_first(&ipe_registry_root); node; node = rb_next(node)) {
>> +               reg = container_of(node, struct ipe_prop_reg, node);
>> +
>> +               storage = insert_or_find_cache(cache, reg->prop);
>> +               if (IS_ERR(storage))
>> +                       return PTR_ERR(storage);
>> +
>> +               if (reg->prop->prealloc) {
>> +                       rc = reg->prop->prealloc(ctx, &storage->storage);
>> +                       if (rc != 0)
>> +                               return rc;
>> +               }
>> +       }
>> +
>> +       return rc;
>> +}
>> +
>> +/**
>> + * evaluate: Process an @ctx against IPE's current active policy.
>> + * @ctx: the engine ctx to perform an evaluation on.
>> + * @cache: the red-black tree root that is used for cache storage.
>> + *
>> + * This uses a preallocated @cache as storage for the properties to avoid
>> + * re-evaulation.
>> + *
>> + * Return:
>> + * -EACCES - A match occurred against a "action=DENY" rule
>> + * -ENOMEM - Out of memory
>> + */
>> +static int evaluate(struct ipe_engine_ctx *ctx, struct rb_root *cache)
>> +{
>> +       int rc = 0;
>> +       bool match = false;
>> +       enum ipe_action action;
>> +       struct ipe_prop_cache *c;
>> +       enum ipe_match match_type;
>> +       const struct ipe_rule *rule;
>> +       const struct ipe_policy *pol;
>> +       const struct ipe_rule_table *rules;
>> +       const struct ipe_prop_container *prop;
>> +
>> +       if (!ipe_active_policy)
> Please use rcu_access_pointer() here.
Thanks. I'm still new to rcu - any comments or corrections regarding it
are greatly appreciated.
>> +               return rc;
>> +
>> +       rcu_read_lock();
>> +
>> +       pol = rcu_dereference(ipe_active_policy);
>> +
>> +       rules = &pol->ops[ctx->op];
>> +
>> +       list_for_each_entry(rule, &rules->rules, next) {
>> +               match = true;
>> +
>> +               list_for_each_entry(prop, &rule->props, next) {
>> +                       void *cache = NULL;
>> +
>> +                       if (prop->prop->prealloc) {
>> +                               c = insert_or_find_cache(cache, prop->prop);
> What's going on with the `cache` pointer here? We give
> insert_or_find_cache() a NULL cache, and then in
> insert_or_find_cache() `new` will be a near-NULL pointer, and it'll
> crash immediately at `while (*new)`? Am I missing something?
>
> Also, I think the intent here is that the preceding call to
> prealloc_cache() should have allocated memory for us. If so, can you
> please add a short comment here, something like "/* won't sleep
> because of preceding prealloc_cache() */"?

Well, this is embarrassing. This is supposed to be the argument, cache,
not the variable, cache. The variable shadowing does indeed do what you
describe.

This didn't come up in any of my testing because none of the
properties introduced in this patch series utilize the cache. It's kept in
to facilitate the storage of potentially expensive operations.

I'm just going to cut out all of this code. It'll be re-added
if something actually needs it.

>> +                               if (IS_ERR(c))
>> +                                       return PTR_ERR(c);
>> +
>> +                               cache = c->storage;
>> +                       }
>> +
>> +                       match = match && prop->prop->eval(ctx, prop->value,
>> +                                                         &cache);
>> +               }
>> +
>> +               if (match)
>> +                       break;
>> +       }
>> +
>> +       if (match) {
>> +               match_type = ipe_match_rule;
>> +               action = rule->action;
>> +       } else if (rules->def != ipe_action_unset) {
>> +               match_type = ipe_match_table;
>> +               action = rules->def;
>> +               rule = NULL;
>> +       } else {
>> +               match_type = ipe_match_global;
>> +               action = pol->def;
>> +               rule = NULL;
>> +       }
>> +
>> +       ipe_audit_match(ctx, cache, match_type, action, rule);
>> +
>> +       if (action == ipe_action_deny)
>> +               rc = -EACCES;
>> +
>> +       if (enforce == 0)
>> +               rc = 0;
>> +
>> +       rcu_read_unlock();
>> +       return rc;
>> +}
>> +
>> +/**
>> + * ipe_process_event: Perform an evaluation of @file, @op, and @hook against
>> + *                   IPE's current active policy.
>> + * @file: File that is being evaluated against IPE policy.
>> + * @op: Operation that the file is being evaluated against.
>> + * @hook: Specific hook that the file is being evaluated through.
>> + *
>> + * Return:
>> + * -ENOMEM: (No Memory)
>> + * -EACCES: (A match occurred against a "action=DENY" rule)
>> + */
>> +int ipe_process_event(const struct file *file, enum ipe_op op,
>> +                     enum ipe_hook hook)
>> +{
>> +       int rc = 0;
>> +       struct ipe_engine_ctx *ctx;
>> +       struct rb_root cache = RB_ROOT;
>> +
>> +       ctx = build_ctx(file, op, hook);
>> +       if (IS_ERR(ctx))
>> +               goto cleanup;
>> +
>> +       rc = prealloc_cache(ctx, &cache);
>> +       if (rc != 0)
>> +               goto cleanup;
>> +
>> +       rc = evaluate(ctx, &cache);
>> +
>> +cleanup:
>> +       free_ctx(ctx);
>> +       destroy_cache(&cache);
>> +       return rc;
>> +}
> [...]
>> diff --git a/security/ipe/ipe-hooks.c b/security/ipe/ipe-hooks.c
> [..]
>> +#define HAS_EXEC(_p, _rp) (((_rp) & PROT_EXEC) || ((_p) & PROT_EXEC))
> This should be unnecessary; reqprot are the protections requested by
> userspace, prot are the possibly expanded protections the kernel is
> applying. I think you just want to use prot and ignore reqprot.
Thanks, I'll correct it.
> [...]
>> diff --git a/security/ipe/ipe-policy.h b/security/ipe/ipe-policy.h
> [...]
>> +extern const char *const ipe_boot_policy;
> I don't see anything in the entire patch series that actually sets
> this variable. Am I missing something?
This variable is set by an auto-generated file, invoked by the tool created
in the first patch of this series. It creates a file called "ipe-bp.c" 
whose
only purpose is to set this variable.
>> +extern const struct ipe_policy *ipe_active_policy;
> [...]
>> diff --git a/security/ipe/ipe-property.c b/security/ipe/ipe-property.c
> [...]
>> +/* global root containing all registered properties */
>> +struct rb_root ipe_registry_root = RB_ROOT;
> [...]
>> +static struct ipe_prop_reg *reg_lookup(const char *key)
>> +{
>> +       struct rb_node *n = ipe_registry_root.rb_node;
>> +
>> +       while (n) {
>> +               int r;
>> +               struct ipe_prop_reg *reg =
>> +                       container_of(n, struct ipe_prop_reg, node);
>> +
>> +               r = strcmp(reg->prop->property_name, key);
>> +               if (r == 0)
>> +                       return reg;
>> +               else if (r > 0)
>> +                       n = n->rb_right;
>> +               else
>> +                       n = n->rb_left;
>> +       }
>> +
>> +       return NULL;
>> +}
> Where is the locking for ipe_registry_root? I've looked through the
> callers and can't find it. Also, please add a lockdep assertion
> (`lockdep_assert_held(...)`) here if possible to ensure that when the
> kernel is buildt with appropriate debugging options turned on
> (CONFIG_LOCKDEP), it will warn about calling this method with
> inappropriate locking.
I'm not sure why locking is necessary on this structure? This structure is
only added to, synchronously, at lsm_init. The first time it's queried 
after
that is core_init with ipe_securityfs_init. Every subsequent time is when
user mode is setup and 1.) IPE is evaluating a binary, or 2.) IPE is 
loading
a policy. We don't support the run time loading of properties, nor do we
support the removal of policies, so the tree should be stable without locks?
> [...]
>> +/**
>> + * ipe_register_property: Insert a property into the registration system.
>> + * @prop: Read-only property structure containing the property_name, as well
>> + *       as the necessary function pointers for a property.
>> + *
>> + * The caller needs to maintain the lifetime of @prop throughout the life of
>> + * the system, after calling ipe_register_property.
>> + *
>> + * All necessary properties need to be loaded via this method before
>> + * loading a policy, otherwise the properties will be ignored as unknown.
>> + *
>> + * Return:
>> + * 0 - OK
>> + * -EEXIST - A key exists with the name @prop->property_name
>> + * -ENOMEM - Out of memory
>> + */
>> +int ipe_register_property(const struct ipe_property *prop);
> Normal Linux kernel style is to have comments on the definitions of
> methods (in the .c files), not in the headers. It looks like you
> duplicated the same comment between the header and the .c file -
> please don't do that. Same thing in a bunch of other places.
Thanks, I'll strip the header comments.
>> +#endif /* IPE_PROPERTY_H */
>> diff --git a/security/ipe/ipe-sysfs.c b/security/ipe/ipe-sysfs.c
> [...]
>> +#else /* !CONFIG_SYSCTL */
>> +
>> +/**
>> + * ipe_sysctl_init: Initialize IPE's sysfs entries.
>> + *
>> + * Return:
>> + * 0 - OK
>> + * -ENOMEM - Sysctl registration failed
>> + */
>> +inline int __init ipe_sysctl_init(void)
> "inline" doesn't make sense to me if the caller is in a different
> compilation unit
I'll remove it.
> [...]
>> diff --git a/security/ipe/ipe.c b/security/ipe/ipe.c
> [...]
>> +/**
>> + * ipe_load_properties: Call the property entry points for all the IPE modules
>> + *                     that were selected at kernel build-time.
>> + *
>> + * Return:
>> + * 0 - OK
>> + */
>> +static int __init ipe_load_properties(void)
>> +{
>> +       return 0;
>> +}
> this belongs in patch 4 ("ipe: add property for trust of boot volume")
I'll move it forward.
> [...]
>> +static int __init ipe_init(void)
>> +{
>> +       int rc = 0;
> useless initialization
I'll fix it.
>> +       rc = ipe_sysctl_init();
>> +       if (rc != 0)
>> +               pr_err("failed to configure sysctl: %d", -rc);
> pr_err() needs to have an explicit \n at the end of the message unless
> you're planning to continue printing more text on the same line via
> pr_cont(). Same issue in many other places.
Easily fixed by adding a \n to pr_fmt. Will be fixed in next iteration.
>> +
>> +       pr_info("mode=%s", (enforce == 1) ? IPE_MODE_ENFORCE :
>> +                                           IPE_MODE_PERMISSIVE);
>> +
>> +       RCU_INIT_POINTER(ipe_active_policy, NULL);
> Why? Statically allocated variables are zero-initialized by default in C.
This is my inexperience with rcu. I recognize statically allocated 
variables
are zero-initialized, however, I thought that the rcu system needed to set
things up with the pointer through this method before it can be used.
I'll remove it.
>> +       security_add_hooks(ipe_hooks, ARRAY_SIZE(ipe_hooks), "IPE");
>> +
>> +       return rc;
>> +}
> [...]
>> +/**
>> + * enforce: Kernel command line parameter to set the permissive mode for IPE
>> + *         at system startup. By default, this will always be in enforce mode.
>> + *
>> + * This is also controlled by the sysctl, "ipe.enforce".
>> + */
>> +module_param(enforce, int, 0644);
>> +MODULE_PARM_DESC(enforce, "enforce/permissive mode switch");
> [...]
>> +/**
>> + * success_audit: Kernel command line parameter to enable success auditing
>> + *               (emit an audit event when a file is allowed) at system
>> + *               startup. By default, this will be off.
>> + *
>> + * This is also controlled by the sysctl, "ipe.success_audit".
>> + */
>> +int success_audit;
>> +module_param(success_audit, int, 0644);
>> +MODULE_PARM_DESC(success_audit, "audit message on allow");
> There is a pending patch series that will allow setting arbitrary
> sysctls from the kernel command line
> (https://lore.kernel.org/lkml/20200330115535.3215-1-vbabka@suse.cz/);
> if that also works for your usecase, you should probably avoid
> explicitly adding module parameters here, unless that is necessary
> because the pending series sets the sysctls too late.
Ah, this is great! It's not a problem with the sysctls being set too 
late - the
enforce and success_audit sysctls only come into play once user land is 
setup
after kernel boot,
>> diff --git a/security/ipe/ipe.h b/security/ipe/ipe.h
> [...]
>> +extern int enforce;
>> +extern int success_audit;
> You probably shouldn't be defining global symbols with such broad
> names to avoid colliding with global symbols defined elsewhere in the
> kernel. Consider adding "ipe_" prefixes to the variable names, or
> something like that.
I'll add the prefixes. Thanks.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

