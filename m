Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 026A41A1069
	for <lists+dm-devel@lfdr.de>; Tue,  7 Apr 2020 17:41:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586274075;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wfeMSTXE27BszwyZHdhpimwSswJrk1ouE1v9Wq7fLvU=;
	b=OmNjrQwIAzMsI28oDCWZ9L9oc/Yoe0J2bRB6u0s87+z0gdgan9fu9x129G/RpAsylUyVHO
	fbbrE+u7LSuAZxXFX+8E9xmrU99i0wRl5xqFgiT/HKOmx5Esw7WnfECKf2ivw+fhT0bhKN
	DvDfDwWHTqJwr/eSl3ZMzAkujUxz6S8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-aNaxqx4wMFy_4j67Yy8ChA-1; Tue, 07 Apr 2020 11:41:13 -0400
X-MC-Unique: aNaxqx4wMFy_4j67Yy8ChA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 315CA107B276;
	Tue,  7 Apr 2020 15:41:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A8561001DF2;
	Tue,  7 Apr 2020 15:41:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E8A318089C8;
	Tue,  7 Apr 2020 15:40:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 037FdjHH025703 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Apr 2020 11:39:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3F3602166B27; Tue,  7 Apr 2020 15:39:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A6E72166B2C
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 15:39:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 002BB8F6166
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 15:39:43 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-169-nPPR35qyMm2U24oeoHl5LA-1; Tue, 07 Apr 2020 11:39:38 -0400
X-MC-Unique: nPPR35qyMm2U24oeoHl5LA-1
Received: by mail-lf1-f66.google.com with SMTP id z23so2728568lfh.8
	for <dm-devel@redhat.com>; Tue, 07 Apr 2020 08:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gmgo6tjFJb4lSSLiG9Gj6gr0AGTXJbzgQ5gfcznRczE=;
	b=IC2fn6ORnuRi81tlV/Zy42khq8WUvJOpK6vO60G2jcco7ZceSBn/Ks6CyhedciDxwg
	y2beWvfslRWI0VbLkWT6nXO142FRKfqs38lien+anrBZnTPzW5ptUXXUcy+BZeQrXtlc
	5p4j7vWLxMtyZxevCA/yQJIkki/7xQ8TdXLXffYaKcggc5JIhqOAx5KaPWpIxFKQMpIy
	XsqqJiiariMhspUW/UMv9o1G0ALyK5o8vtVkxggCXXE1WXQlVvpsdH0zZyz8zmo5v90r
	DZ9atTLMe5Xyv7YilAS/pBGNKCYUxw8+gfguv2whROGvLoRct8hZpfUfQg2R7R3jWOmi
	nZ0A==
X-Gm-Message-State: AGi0PubdFlPTSKGl1TLVeTbgUczUnNabqLk/6fmctJXevtQna61fQyDU
	C3T3i6WCs/pubo39y0Ztzfi9V06NxVJhXeG43Y8ruWz3rAU=
X-Google-Smtp-Source: APiQypLUqTB4BLvo/abfr8TjM9VOjupLvAgaL5qCFX3+IZDNWlEuIZYam5IsxuvRCvKYeTrsrD5vfCqyZMYzstjMFVM=
X-Received: by 2002:ac2:5dc6:: with SMTP id x6mr1847051lfq.108.1586273976447; 
	Tue, 07 Apr 2020 08:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200406221439.1469862-1-deven.desai@linux.microsoft.com>
	<20200406221439.1469862-4-deven.desai@linux.microsoft.com>
In-Reply-To: <20200406221439.1469862-4-deven.desai@linux.microsoft.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 7 Apr 2020 17:39:09 +0200
Message-ID: <CAG48ez2FfRK-ivZ0cJ4k-UqKfduQS_b2WCcD5Aj45sJKAqS58Q@mail.gmail.com>
To: deven.desai@linux.microsoft.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 037FdjHH025703
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
Subject: Re: [dm-devel] [RFC PATCH v2 03/12] security: add ipe lsm policy
 parser and policy loading
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 7, 2020 at 12:14 AM <deven.desai@linux.microsoft.com> wrote:
[...]
> Adds the policy parser and the policy loading to IPE, along with the
> related sysfs and securityfs entries.
[...]
> diff --git a/security/ipe/ipe-parse.c b/security/ipe/ipe-parse.c
[...]
> +/* Internal Type Definitions */
> +enum property_priority {
> +       other = 0,
> +       action = 1,
> +       op = 2,
> +       default_action = 3,
> +       policy_ver = 4,
> +       policy_name = 5,
> +};
> +
> +struct token {
> +       struct list_head        next_tok;
> +       const char              *key;
> +       enum property_priority  key_priority;
> +       const char              *val;
> +};
> +
[...]
> +/**
> + * ipe_free_policy: Deallocate an ipe_policy structure.
> + * @pol: Policy to free.
> + */
> +void ipe_free_policy(struct ipe_policy *pol)
> +{
> +       size_t i;
> +       struct ipe_rule *ptr;
> +       struct ipe_rule_table *op;
> +       struct list_head *l_ptr, *l_next;
> +
> +       if (IS_ERR_OR_NULL(pol))
> +               return;
> +
> +       for (i = 0; i < ARRAY_SIZE(pol->ops); ++i) {
> +               op = &pol->ops[i];
> +
> +               list_for_each_safe(l_ptr, l_next, &op->rules) {
> +                       ptr = list_entry(l_ptr, struct ipe_rule, next);
> +                       list_del(l_ptr);
> +                       ipe_free_rule(ptr);
> +               }
> +       }
> +
> +       kfree(pol->policy_name);
> +       kfree(pol);
> +       pol = NULL;

What is this assignment supposed to do?

> +}
[...]
> diff --git a/security/ipe/ipe-policy.c b/security/ipe/ipe-policy.c
[...]
> +/**
> + * ipe_is_active_policy: Determine if @policy is the currently active policy.
> + * @policy: Policy to check if it's the active policy.
> + *
> + * NOTE: If this attribute is needed to be consistent over a critical section,
> + *       do not use this function, as it does not hold the read lock over the
> + *       entirety of the critical section.
> + *
> + * Return:
> + * true - @policy is the active policy
> + * false - @policy is not the active policy
> + */
> +bool ipe_is_active_policy(const struct ipe_policy *policy)
> +{
> +       bool result;
> +
> +       rcu_read_lock();
> +
> +       result = rcu_dereference(ipe_active_policy) == policy;
> +
> +       rcu_read_unlock();

You're not actually accessing the pointer, so you can use rcu_access_pointer()
and get rid of the rcu_read_lock()/rcu_read_unlock(). Then this helper turns
into a one-liner.

> +       return result;
> +}
> +
> +/**
> + * ipe_update_active_policy: Determine if @old is the active policy, and update
> + *                          the active policy if necessary.
> + * @old: The previous policy that the update is trying to replace.
> + * @new: The new policy attempting to replace @old.
> + *
> + * If @old is not the active policy, nothing will be done.
> + *
> + * Return:
> + * 0 - OK
> + * -EBADMSG - Invalid Policy
> + */
> +int ipe_update_active_policy(const struct ipe_policy *old,
> +                            const struct ipe_policy *new)
> +{
> +       int rc = 0;
> +       const struct ipe_policy *curr_policy = NULL;
> +
> +       /* no active policy, safe to update */
> +       if (!ipe_active_policy)

This should be rcu_access_pointer().

> +               return 0;
[...]
> +}
[...]
> diff --git a/security/ipe/ipe-secfs.c b/security/ipe/ipe-secfs.c
[...]
> +/**
> + * alloc_callback: Callback given to verify_pkcs7_signature function to set
> + *                the inner content reference and parse the policy.
> + * @ctx: "ipe_policy_node" to set inner content, size and parsed policy of.
> + * @data: Start of PKCS#7 inner content.
> + * @len: Length of @data.
> + * @asn1hdrlen: Unused.
> + *
> + * Return:
> + * 0 - OK
> + * ERR_PTR(-EBADMSG) - Invalid policy syntax
> + * ERR_PTR(-ENOMEM) - Out of memory
> + */
> +static int alloc_callback(void *ctx, const void *data, size_t len,
> +                         size_t asn1hdrlen)
> +{
> +       char *cpy = NULL;
> +       struct ipe_policy *pol = NULL;
> +       struct ipe_policy_node *n = (struct ipe_policy_node *)ctx;
> +
> +       n->content = (const u8 *)data;
> +       n->content_size = len;
> +
> +       if (len == 0)
> +               return -EBADMSG;
> +
> +       cpy = kzalloc(len + 1, GFP_KERNEL);
> +       if (!cpy)
> +               return -ENOMEM;
> +
> +       (void)strncpy(cpy, data, len);

Shouldn't this just be memcpy()?

> +       pol = ipe_parse_policy(cpy);
> +       if (IS_ERR(pol)) {
> +               kfree(cpy);
> +               return PTR_ERR(pol);
> +       }
> +
> +       n->parsed = pol;
> +       kfree(cpy);
> +       return 0;
> +}
[...]
> +static ssize_t ipe_secfs_new_policy(struct file *f, const char __user *data,
> +                                   size_t len, loff_t *offset)
> +{
> +       ssize_t rc = 0;
> +       u8 *cpy = NULL;
> +       ssize_t written = 0;
> +
> +       if (!ns_capable(current_user_ns(), CAP_MAC_ADMIN))
> +               return -EPERM;

Use file_ns_capable(f, &init_user_ns, CAP_MAC_ADMIN) instead, both here and
elsewhere.

> +       cpy = kzalloc(len, GFP_KERNEL);
> +       if (!cpy) {
> +               rc = -ENOMEM;
> +               goto err;
> +       }
> +
> +       written = simple_write_to_buffer(cpy, len, offset, data, len);
> +       if (written < 0) {
> +               rc = written;
> +               goto err;
> +       }

This should probably be memdup_user() instead of
kzalloc()+simple_write_to_buffer()?

> +       rc = ipe_build_policy_secfs_node(cpy, written);
> +err:
> +       kfree(cpy);
> +       return rc < 0 ? rc : written;
> +}
> +
> +/**
> + * retrieve_backed_dentry: Retrieve a dentry with a backing inode, identified
> + *                        by @name, under @parent.
> + * @name: Name of the dentry under @parent.
> + * @parent: The parent dentry to search under for @name.
> + * @size: Length of @name.
> + *
> + * This takes a reference to the returned dentry. Caller needs to call dput
> + * to drop the reference.
> + *
> + * Return:
> + * valid dentry - OK
> + * ERR_PTR - Error, see lookup_one_len_unlocked
> + * NULL - No backing inode was found
> + */
> +static struct dentry *retrieve_backed_dentry(const char *name,
> +                                            struct dentry *parent,
> +                                            size_t size)
> +{
> +       int rc = 0;
> +       struct dentry *tmp = NULL;
> +
> +       tmp = lookup_one_len_unlocked(name, parent, size);
> +       if (IS_ERR(tmp)) {
> +               rc = PTR_ERR(tmp);
> +               goto out;
> +       }

You could just "return tmp;" here.

> +
> +       if (!d_really_is_positive(tmp))
> +               goto out1;

And here "return NULL;".

> +       return tmp;
> +out1:
> +       tmp = NULL;

This just sets a variable that is never read again to NULL?

> +out:
> +       return rc == 0 ? NULL : ERR_PTR(rc);
> +}
> +
> +/**
> + * ipe_secfs_del_policy: Delete a policy indicated by the name provided by
> + *                      @data
> + * @f: Unused.
> + * @data: Buffer containing the policy id to delete.
> + * @len: Length of @data.
> + * @offset: Offset into @data.
> + *
> + * NOTE: Newlines are treated as part of the name, if using echo to test,
> + * use -n to prohibit the silent addition of a newline.
> + *
> + * Return:
> + * > 0 - OK
> + * -ENOMEM - Out of memory
> + * -EPERM - Policy is active
> + * -ENOENT - Policy does not exist
> + * -EPERM - if a MAC subsystem is enabled, missing CAP_MAC_ADMIN
> + * Other - See retrieve_backed_dentry
> + */
> +static ssize_t ipe_secfs_del_policy(struct file *f, const char __user *data,
> +                                   size_t len, loff_t *offset)
> +{
> +       ssize_t rc = 0;
> +       char *id = NULL;
> +       ssize_t written = 0;
> +       struct dentry *raw = NULL;
> +       struct dentry *content = NULL;
> +       struct inode *policy_i = NULL;
> +       struct dentry *policy_root = NULL;
> +       struct inode *policies_root = NULL;
> +       const struct ipe_policy *target = NULL;
> +
> +       if (!ns_capable(current_user_ns(), CAP_MAC_ADMIN))
> +               return -EPERM;
> +
> +       id = kzalloc(len, GFP_KERNEL);
> +       if (!id) {
> +               rc = -ENOMEM;
> +               goto out;
> +       }
> +
> +       written = simple_write_to_buffer(id, len, offset, data, len);
> +       if (written < 0) {
> +               rc = written;
> +               goto out;
> +       }
> +
> +       policies_root = d_inode(ipe_policies_root);
> +
> +       policy_root = retrieve_backed_dentry(id, ipe_policies_root, written);
> +       if (IS_ERR_OR_NULL(policy_root)) {
> +               rc = IS_ERR(policy_root) ? PTR_ERR(policy_root) : -ENOENT;
> +               goto out;
> +       }
> +
> +       policy_i = d_inode(policy_root);
> +
> +       /* if the found dentry matches boot policy, fail */
> +       if (boot_policy_node == policy_root) {
> +               rc = -EACCES;
> +               goto out1;
> +       }
> +
> +       target = ((struct ipe_policy_node *)policy_i->i_private)->parsed;
> +
> +       /* fail if it's the active policy */
> +       if (ipe_is_active_policy(target)) {
> +               rc = -EPERM;
> +               goto out1;
> +       }

Why can it not become the active policy after this check?

> +       raw = retrieve_backed_dentry(IPE_FULL_CONTENT, policy_root,
> +                                    strlen(IPE_FULL_CONTENT));
> +       if (IS_ERR_OR_NULL(raw)) {
> +               rc = IS_ERR(raw) ? PTR_ERR(raw) : -ENOENT;
> +               goto out1;
> +       }
> +
> +       content = retrieve_backed_dentry(IPE_INNER_CONTENT, policy_root,
> +                                        strlen(IPE_INNER_CONTENT));
> +       if (IS_ERR_OR_NULL(content)) {
> +               rc = IS_ERR(content) ? PTR_ERR(content) : -ENOENT;
> +               goto out2;
> +       }
> +
> +       inode_lock(policies_root);
> +       ipe_free_policy_node(policy_i->i_private);
> +       policy_i->i_private = NULL;
> +       inode_unlock(policies_root);
> +
> +       dput(raw);
> +       dput(content);
> +       dput(policy_root);
> +       securityfs_remove(raw);
> +       securityfs_remove(content);
> +       securityfs_remove(policy_root);
> +
> +       kfree(id);
> +       return written;
> +out2:
> +       dput(raw);
> +out1:
> +       dput(policy_root);
> +out:
> +       kfree(id);
> +       return rc;
> +}
> +
> +/**
> + * ipe_secfs_rd_policy: Read the raw content (full enveloped PKCS7) data of
> + *                     the policy stored within the file's parent inode.
> + * @f: File representing the securityfs entry.
> + * @data: User mode buffer to place the raw pkcs7.
> + * @len: Length of @data.
> + * @offset: Offset into @data.
> + *
> + * Return:
> + * > 0 - OK
> + * -ENOMEM - Out of memory
> + */
> +static ssize_t ipe_secfs_rd_policy(struct file *f, char __user *data,
> +                                  size_t size, loff_t *offset)
> +{
> +       ssize_t rc = 0;
> +       size_t avail = 0;
> +       u8 *buffer = NULL;
> +       struct inode *root = NULL;
> +       const struct ipe_policy_node *node = NULL;
> +
> +       root = d_inode(f->f_path.dentry->d_parent);
> +
> +       inode_lock_shared(root);
> +       node = (const struct ipe_policy_node *)root->i_private;
> +
> +       avail = node->data_len;
> +       buffer = kmemdup(node->data, avail, GFP_KERNEL);
> +       if (!buffer) {
> +               rc = -ENOMEM;
> +               goto cleanup;
> +       }
> +
> +       rc = simple_read_from_buffer(data, size, offset, buffer, avail);
> +cleanup:
> +       inode_unlock_shared(root);

Same thing as in ipe_secfs_rd_content(): simple_read_from_buffer() needlessly
within locked section, buffer not freed.

> +
> +       return rc;
> +}
> +
> +/**
> + * ipe_secfs_ud_policy: Update a policy in place with a new PKCS7 policy.
> + * @f: File representing the securityfs entry.
> + * @data: Buffer user mode to place the raw pkcs7.
> + * @len: Length of @data.
> + * @offset: Offset into @data.
> + *
> + * Return:
> + * 0 - OK
> + * -EBADMSG - Invalid policy format
> + * -ENOMEM - Out of memory
> + * -EPERM - if a MAC subsystem is enabled, missing CAP_MAC_ADMIN
> + * -EINVAL - Incorrect policy name for this node, or version is < current
> + */
> +static ssize_t ipe_secfs_ud_policy(struct file *f, const char __user *data,
> +                                  size_t len, loff_t *offset)
> +{
> +       ssize_t rc = 0;
> +       u8 *cpy = NULL;
> +       ssize_t written = 0;
> +       struct inode *root = NULL;
> +       struct crypto_shash *tfm = NULL;
> +       struct ipe_policy_node *new = NULL;
> +       struct ipe_policy_node *old = NULL;
> +
> +       if (!ns_capable(current_user_ns(), CAP_MAC_ADMIN))
> +               return -EPERM;
> +
> +       cpy = kzalloc(len, GFP_KERNEL);
> +       if (!cpy) {
> +               rc = -ENOMEM;
> +               goto out;
> +       }
> +
> +       written = simple_write_to_buffer(cpy, len, offset, data, len);
> +       if (written < 0) {
> +               rc = written;
> +               goto out;
> +       }

You'd probably be better off just doing memdup_user() here.
simple_write_to_buffer() only makes sense if you have a buffer that can be
continuously updated with multiple writes.

> +       new = ipe_alloc_policy_node(cpy, len);
> +       if (IS_ERR(new)) {
> +               rc = PTR_ERR(new);
> +               goto out;
> +       }
> +
> +       tfm = crypto_alloc_shash("sha1", 0, 0);
> +       if (IS_ERR(tfm))
> +               goto out2;
> +
> +       root = d_inode(f->f_path.dentry->d_parent);
> +       inode_lock(root);
> +
> +       old = (struct ipe_policy_node *)root->i_private;
> +
> +       if (strcmp(old->parsed->policy_name, new->parsed->policy_name)) {
> +               rc = -EINVAL;
> +               goto out3;
> +       }
> +
> +       if (!ipe_is_valid_policy(old->parsed, new->parsed)) {
> +               rc = -EINVAL;
> +               goto out3;
> +       }
> +
> +       rc = ipe_update_active_policy(old->parsed, new->parsed);
> +       if (rc != 0)
> +               goto out3;
> +
> +       ipe_audit_policy_load(new->parsed, new->data, new->data_len, tfm);
> +       swap(root->i_private, new);
> +
> +       inode_unlock(root);
> +       kfree(cpy);
> +       ipe_free_policy_node(new);
> +       crypto_free_shash(tfm);
> +
> +       return written;
> +out3:
> +       inode_unlock(root);
> +       ipe_free_policy_node(new);
> +out2:
> +       crypto_free_shash(tfm);
> +out:
> +       kfree(cpy);
> +       return rc;
> +}
[...]
> +static ssize_t ipe_secfs_rd_content(struct file *f, char __user *data,
> +                                   size_t size, loff_t *offset)
> +{
> +       ssize_t rc = 0;
> +       size_t avail = 0;
> +       u8 *buffer = NULL;
> +       struct inode *root = NULL;
> +       const struct ipe_policy_node *node = NULL;
> +
> +       root = d_inode(f->f_path.dentry->d_parent);
> +
> +       inode_lock(root);
> +       node = (const struct ipe_policy_node *)root->i_private;
> +
> +       avail = node->content_size;
> +       buffer = kmemdup(node->content, avail, GFP_KERNEL);
> +       if (!buffer) {
> +               rc = -ENOMEM;
> +               goto cleanup;
> +       }
> +
> +       rc = simple_read_from_buffer(data, size, offset, buffer, avail);
> +cleanup:
> +       inode_unlock(root);

Why are you nod doing the simple_read_from_buffer() after inode_unlock()?
The way you're doing it now, there isn't really a point in the kmemdup() at
all...
Also, you'll have to free the buffer before returning.

> +       return rc;
> +}
[...]
> diff --git a/security/ipe/ipe-sysfs.c b/security/ipe/ipe-sysfs.c
[...]
> +static int ipe_switch_active_policy(struct ctl_table *table, int write,
> +                                   void __user *buffer, size_t *lenp,
> +                                   loff_t *ppos)
> +{
> +       int rc = 0;
> +       char *id = NULL;
> +       size_t size = 0;
> +
> +       if (write) {
> +               id = kzalloc((*lenp) + 1, GFP_KERNEL);
> +               if (!id)
> +                       return -ENOMEM;
> +
> +               table->data = id;
> +               table->maxlen = (*lenp) + 1;
> +
> +               rc = proc_dostring(table, write, buffer, lenp, ppos);
> +               if (rc != 0)
> +                       goto out;
> +
> +               rc = ipe_set_active_policy(id, strlen(id));
> +       } else {
> +               rcu_read_lock();
> +               size = strlen(rcu_dereference(ipe_active_policy)->policy_name);

Can't `ipe_active_policy` be NULL here?

> +               rcu_read_unlock();
> +
> +               id = kzalloc(size + 1, GFP_KERNEL);

The `+ 1` seems unnecessary.

> +               if (!id)
> +                       return -ENOMEM;
> +
> +               rcu_read_lock();
> +               strncpy(id, rcu_dereference(ipe_active_policy)->policy_name,
> +                       size);
> +               rcu_read_unlock();
> +
> +               table->data = id;
> +               table->maxlen = size;
> +
> +               rc = proc_dostring(table, write, buffer, lenp, ppos);
> +       }
> +out:
> +       kfree(id);
> +       return rc;
> +}
> +
> +#endif /* CONFIG_SECURITYFS */
[...]
> diff --git a/security/ipe/ipe.c b/security/ipe/ipe.c
[...]
> +
> +/**
> + * strict_parse: Kernel command line parameter to enable strict parsing of
> + *              IPE policies - causing unrecognized properties to fail
> + *              parsing. This breaks backwards compatibility of IPE policies,
> + *              when enabled.

I guess the backwards compatibility stuff is referring to an out-of-tree version
of this series that you've already shipped?

> + * This is also controlled by the sysctl, "ipe.strict_parse".
> + */

(Also, same thing as in the other patch re sysctls and kernel command line
parameters for the same feature.)


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

