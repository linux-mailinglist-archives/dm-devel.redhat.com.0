Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CCC609FA
	for <lists+dm-devel@lfdr.de>; Fri,  5 Jul 2019 18:07:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2013A30C543D;
	Fri,  5 Jul 2019 16:05:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B680468C92;
	Fri,  5 Jul 2019 16:05:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE322206D2;
	Fri,  5 Jul 2019 16:05:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x65G4TDQ029913 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jul 2019 12:04:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 676531001B30; Fri,  5 Jul 2019 16:04:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6191F1001B2F
	for <dm-devel@redhat.com>; Fri,  5 Jul 2019 16:04:27 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D538230056BF
	for <dm-devel@redhat.com>; Fri,  5 Jul 2019 16:03:52 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n9so10473894wru.0
	for <dm-devel@redhat.com>; Fri, 05 Jul 2019 09:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=1Z8AKWBI2ziCsk54sd8sCbK9rfD8NMCWaTTsSLxycZo=;
	b=n/VPsIo1zVeyr8ugN2I5KxINDBT50ySFbJPo9kmuRQUGsobUVbb8vQnKtyBDjGNxcM
	IoPkQNfrOCPpNW3OkbewH0h217dNGqargxg684Npzlayt2cS3zUph66uLpZ8C6uCXWQL
	eW8EIbD55GQSjW/kopISvEyhYzUuFNTvc7mm1DsOI84TU3N50IA4iquMJzxqx0vAObHX
	ZpCM9hk+DHTMTmY3JGB9ZGMt96Wd3FRu4p5c2ANOqWROcLPVxCBUUnB4zzcpQtzVAix9
	Uv9Z0+Nf6kfRwQTbfaB+r0/DCmfOSTmDbTumAHtvHLsp53eYzESd53wrr2DRMqsuGSu0
	Tg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=1Z8AKWBI2ziCsk54sd8sCbK9rfD8NMCWaTTsSLxycZo=;
	b=eVoJ3zZxu5aj8iXMp2OcwHRr89GnYDVDGetVZJrclJ1uwTbLqvIpuiwmlvym8ifyBJ
	dL4A7dq9tnVZxa64ZZvmhwSFqKtcfyZ6AdaE1A/uTArnOReyz34PotzinanL+Sq/jyf0
	25DnG6GsMMOAK/0FALRisN+1vXSKbTgIq2a6jJs4zm9wZXJBHikiYEI3L5snB6tzYPpI
	sIu9JanAYpluhTbXk1AGB95UWaA/ihuHxOxc4+TTeRreiEyhlq/bJr0xOeL0KeVZgzsf
	x+NJT6GGHkxFNd70iNs+MFOPtqzS4lMuciGWbegAXVul8Xf88NGh5w9AnyYQesCejlK2
	mGuQ==
X-Gm-Message-State: APjAAAXWkdS8HoGCn2PA0GOY2aotD30jHolWopgQVP/65r+FTdXFuKWf
	XX1mINyL1jygbepNBOzJ+JLWfAl/eL8=
X-Google-Smtp-Source: APXvYqyk5LsZCFYM9d90+DAVr2xbfLailDkHJfkdstUTmqAKdzfLoiurddG+U69p3wC+OKs/GefJTA==
X-Received: by 2002:adf:ea8b:: with SMTP id s11mr4613036wrm.100.1562342631441; 
	Fri, 05 Jul 2019 09:03:51 -0700 (PDT)
Received: from [10.94.250.119] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	l13sm3889969wrt.16.2019.07.05.09.03.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Jul 2019 09:03:50 -0700 (PDT)
To: Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com
References: <20190703162504.GA34397@lobo>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <fb809628-40e3-245a-dda4-034eee9a931b@arrikto.com>
Date: Fri, 5 Jul 2019 19:03:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190703162504.GA34397@lobo>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 05 Jul 2019 16:03:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Fri, 05 Jul 2019 16:03:53 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: 0.202  (DKIM_INVALID, DKIM_SIGNED, PDS_NO_HELO_DNS,
	SPF_NONE) 209.85.221.65 mail-wr1-f65.google.com
	209.85.221.65 mail-wr1-f65.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: John Dorminy <jdorminy@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm snapshot: add optional discard support
 features
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 05 Jul 2019 16:07:13 +0000 (UTC)

Hi Mike,

A question inline.

On 7/3/19 7:25 PM, Mike Snitzer wrote:
> Add 2 _optional_ features to the snapshot target:
> 
> discard_zeroes_cow - a discard issued to the snapshot device that maps
> to entire chunks to will zero the corresponding exception(s) in the
> snapshot's exception store.
> 
> discard_passdown_origin - a discard to the snapshot device is passed down
> to the snapshot-origin's underlying device.  This doesn't cause copy-out
> to the snapshot exception store because the snapshot-origin target is
> bypassed.
> 
> The discard_passdown_origin feature depends on the discard_zeroes_cow
> feature being enabled.
> 
> When these 2 features are enabled they allow a temporarily read-only
> device that has completely exhausted its free space to recover space.
> To do so dm-snapshot provides temporary buffer to accommodate writes
> that the temporarily read-only device cannot handle yet.  Once the upper
> layer frees space (e.g. fstrim to XFS) the discards issued to the
> dm-snapshot target will be issued to underlying read-only device whose
> free space was exhausted.  In addition those discards will also cause
> zeroes to be written to the snapshot exception store if corresponding
> exceptions exist.  If the underlying origin device provides
> deduplication for zero blocks then if/when the snapshot is merged backed
> to the origin those blocks will become unused.  Once the origin has
> gained adequate space, merging the snapshot back to the thinly
> provisioned device will permit continued use of that device without the
> temporary space provided by the snapshot.
> 
> Requested-by: John Dorminy <jdorminy@redhat.com>
> Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> ---
>  Documentation/device-mapper/snapshot.txt |  16 +++
>  drivers/md/dm-snap.c                     | 168 +++++++++++++++++++++++++++----
>  2 files changed, 167 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/device-mapper/snapshot.txt b/Documentation/device-mapper/snapshot.txt
> index b8bbb516f989..1810833f6dc6 100644
> --- a/Documentation/device-mapper/snapshot.txt
> +++ b/Documentation/device-mapper/snapshot.txt
> @@ -31,6 +31,7 @@ its visible content unchanged, at least until the <COW device> fills up.
>  
>  
>  *) snapshot <origin> <COW device> <persistent?> <chunksize>
> +   [<# feature args> [<arg>]*]
>  
>  A snapshot of the <origin> block device is created. Changed chunks of
>  <chunksize> sectors will be stored on the <COW device>.  Writes will
> @@ -53,8 +54,23 @@ When loading or unloading the snapshot target, the corresponding
>  snapshot-origin or snapshot-merge target must be suspended. A failure to
>  suspend the origin target could result in data corruption.
>  
> +Optional features:
> +
> +   discard_zeroes_cow - a discard issued to the snapshot device that
> +   maps to entire chunks to will zero the corresponding exception(s) in
> +   the snapshot's exception store.
> +
> +   discard_passdown_origin - a discard to the snapshot device is passed
> +   down to the snapshot-origin's underlying device.  This doesn't cause
> +   copy-out to the snapshot exception store because the snapshot-origin
> +   target is bypassed.
> +
> +   The discard_passdown_origin feature depends on the discard_zeroes_cow
> +   feature being enabled.
> +
>  
>  * snapshot-merge <origin> <COW device> <persistent> <chunksize>
> +  [<# feature args> [<arg>]*]
>  
>  takes the same table arguments as the snapshot target except it only
>  works with persistent snapshots.  This target assumes the role of the
> diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
> index 3107f2b1988b..e894302619dd 100644
> --- a/drivers/md/dm-snap.c
> +++ b/drivers/md/dm-snap.c
> @@ -134,7 +134,10 @@ struct dm_snapshot {
>  	 * - I/O error while merging
>  	 *	=> stop merging; set merge_failed; process I/O normally.
>  	 */
> -	int merge_failed;
> +	bool merge_failed:1;
> +
> +	bool discard_zeroes_cow:1;
> +	bool discard_passdown_origin:1;
>  
>  	/*
>  	 * Incoming bios that overlap with chunks being merged must wait
> @@ -1173,12 +1176,64 @@ static void stop_merge(struct dm_snapshot *s)
>  	clear_bit(SHUTDOWN_MERGE, &s->state_bits);
>  }
>  
> +static int parse_snapshot_features(struct dm_arg_set *as, struct dm_snapshot *s,
> +				   struct dm_target *ti)
> +{
> +	int r;
> +	unsigned argc;
> +	const char *arg_name;
> +
> +	static const struct dm_arg _args[] = {
> +		{0, 2, "Invalid number of feature arguments"},
> +	};
> +
> +	/*
> +	 * No feature arguments supplied.
> +	 */
> +	if (!as->argc)
> +		return 0;
> +
> +	r = dm_read_arg_group(_args, as, &argc, &ti->error);
> +	if (r)
> +		return -EINVAL;
> +
> +	while (argc && !r) {
> +		arg_name = dm_shift_arg(as);
> +		argc--;
> +
> +		if (!strcasecmp(arg_name, "discard_zeroes_cow"))
> +			s->discard_zeroes_cow = true;
> +
> +		else if (!strcasecmp(arg_name, "discard_passdown_origin"))
> +			s->discard_passdown_origin = true;
> +
> +		else {
> +			ti->error = "Unrecognised feature requested";
> +			r = -EINVAL;
> +			break;
> +		}
> +	}
> +
> +	if (!s->discard_zeroes_cow && s->discard_passdown_origin) {
> +		/*
> +		 * TODO: really these are disjoint.. but ti->num_discard_bios
> +		 * and dm_bio_get_target_bio_nr() require rigid constraints.
> +		 */
> +		ti->error = "discard_passdown_origin feature depends on discard_zeroes_cow";
> +		r = -EINVAL;
> +	}
> +
> +	return r;
> +}
> +
>  /*
> - * Construct a snapshot mapping: <origin_dev> <COW-dev> <p|po|n> <chunk-size>
> + * Construct a snapshot mapping:
> + * <origin_dev> <COW-dev> <p|po|n> <chunk-size> [<# feature args> [<arg>]*]
>   */
>  static int snapshot_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  {
>  	struct dm_snapshot *s;
> +	struct dm_arg_set as;
>  	int i;
>  	int r = -EINVAL;
>  	char *origin_path, *cow_path;
> @@ -1186,8 +1241,8 @@ static int snapshot_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	unsigned args_used, num_flush_bios = 1;
>  	fmode_t origin_mode = FMODE_READ;
>  
> -	if (argc != 4) {
> -		ti->error = "requires exactly 4 arguments";
> +	if (argc < 4) {
> +		ti->error = "requires 4 or more arguments";
>  		r = -EINVAL;
>  		goto bad;
>  	}
> @@ -1204,6 +1259,13 @@ static int snapshot_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  		goto bad;
>  	}
>  
> +	as.argc = argc;
> +	as.argv = argv;
> +	dm_consume_args(&as, 4);
> +	r = parse_snapshot_features(&as, s, ti);
> +	if (r)
> +		goto bad_features;
> +
>  	origin_path = argv[0];
>  	argv++;
>  	argc--;
> @@ -1289,6 +1351,8 @@ static int snapshot_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  
>  	ti->private = s;
>  	ti->num_flush_bios = num_flush_bios;
> +	if (s->discard_zeroes_cow)
> +		ti->num_discard_bios = (s->discard_passdown_origin ? 2 : 1);
>  	ti->per_io_data_size = sizeof(struct dm_snap_tracked_chunk);
>  
>  	/* Add snapshot to the list of snapshots for this origin */
> @@ -1336,29 +1400,22 @@ static int snapshot_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  
>  bad_read_metadata:
>  	unregister_snapshot(s);
> -
>  bad_load_and_register:
>  	mempool_exit(&s->pending_pool);
> -
>  bad_pending_pool:
>  	dm_kcopyd_client_destroy(s->kcopyd_client);
> -
>  bad_kcopyd:
>  	dm_exception_table_exit(&s->pending, pending_cache);
>  	dm_exception_table_exit(&s->complete, exception_cache);
> -
>  bad_hash_tables:
>  	dm_exception_store_destroy(s->store);
> -
>  bad_store:
>  	dm_put_device(ti, s->cow);
> -
>  bad_cow:
>  	dm_put_device(ti, s->origin);
> -
>  bad_origin:
> +bad_features:
>  	kfree(s);
> -
>  bad:
>  	return r;
>  }
> @@ -1806,6 +1863,32 @@ static void remap_exception(struct dm_snapshot *s, struct dm_exception *e,
>  		(bio->bi_iter.bi_sector & s->store->chunk_mask);
>  }
>  
> +static void zero_callback(int read_err, unsigned long write_err, void *context)
> +{
> +	struct dm_snapshot *s = context;
> +
> +	up(&s->cow_count);
> +}
> +
> +static void zero_exception(struct dm_snapshot *s, struct dm_exception *e,
> +			   struct bio *bio, chunk_t chunk)
> +{
> +	struct dm_io_region dest;
> +
> +	dest.bdev = s->cow->bdev;
> +	dest.sector = bio->bi_iter.bi_sector;
> +	dest.count = s->store->chunk_size;
> +
> +	down(&s->cow_count);
> +	dm_kcopyd_zero(s->kcopyd_client, 1, &dest, 0, zero_callback, s);
> +}
> +
> +static bool io_overlaps_chunk(struct dm_snapshot *s, struct bio *bio)
> +{
> +	return bio->bi_iter.bi_size ==
> +		(s->store->chunk_size << SECTOR_SHIFT);
> +}
> +
>  static int snapshot_map(struct dm_target *ti, struct bio *bio)
>  {
>  	struct dm_exception *e;
> @@ -1839,10 +1922,42 @@ static int snapshot_map(struct dm_target *ti, struct bio *bio)
>  		goto out_unlock;
>  	}
>  
> +	if (unlikely(bio_op(bio) == REQ_OP_DISCARD)) {
> +		if (s->discard_passdown_origin && dm_bio_get_target_bio_nr(bio)) {
> +			/*
> +			 * passdown discard to origin (without triggering
> +			 * snapshot exceptions via do_origin; doing so would
> +			 * defeat the goal of freeing space in origin that is
> +			 * implied by the "discard_passdown_origin" feature)
> +			 */
> +			bio_set_dev(bio, s->origin->bdev);
> +			track_chunk(s, bio, chunk);
> +			goto out_unlock;
> +		}
> +		/* discard to snapshot (target_bio_nr == 0) zeroes exceptions */
> +	}
> +
>  	/* If the block is already remapped - use that, else remap it */
>  	e = dm_lookup_exception(&s->complete, chunk);
>  	if (e) {
>  		remap_exception(s, e, bio, chunk);
> +		if (unlikely(bio_op(bio) == REQ_OP_DISCARD) &&
> +		    io_overlaps_chunk(s, bio)) {
> +			dm_exception_table_unlock(&lock);
> +			up_read(&s->lock);
> +			zero_exception(s, e, bio, chunk);
> +			goto out;
> +		}
> +		goto out_unlock;
> +	}

In case an exception exists for a chunk and we get a discard for it, we
want to zero the corresponding exception in the exception store.

The code remaps the discard bio, issues the zeroing operation by calling
zero_exception() and returns DM_MAPIO_REMAPPED. If I am not missing
something, device mapper core will then submit the discard bio to the
COW device, so we end up both zeroing and discarding the chunk in the
COW device.

Is this deliberate?

Thanks,
Nikos

> +
> +	if (unlikely(bio_op(bio) == REQ_OP_DISCARD)) {
> +		/*
> +		 * If no exception exists, complete discard immediately
> +		 * otherwise it'll trigger copy-out.
> +		 */
> +		bio_endio(bio);
> +		r = DM_MAPIO_SUBMITTED;
>  		goto out_unlock;
>  	}
>  
> @@ -1890,9 +2005,7 @@ static int snapshot_map(struct dm_target *ti, struct bio *bio)
>  
>  		r = DM_MAPIO_SUBMITTED;
>  
> -		if (!pe->started &&
> -		    bio->bi_iter.bi_size ==
> -		    (s->store->chunk_size << SECTOR_SHIFT)) {
> +		if (!pe->started && io_overlaps_chunk(s, bio)) {
>  			pe->started = 1;
>  
>  			dm_exception_table_unlock(&lock);
> @@ -2138,6 +2251,7 @@ static void snapshot_status(struct dm_target *ti, status_type_t type,
>  {
>  	unsigned sz = 0;
>  	struct dm_snapshot *snap = ti->private;
> +	unsigned num_features;
>  
>  	switch (type) {
>  	case STATUSTYPE_INFO:
> @@ -2180,6 +2294,14 @@ static void snapshot_status(struct dm_target *ti, status_type_t type,
>  		DMEMIT("%s %s", snap->origin->name, snap->cow->name);
>  		snap->store->type->status(snap->store, type, result + sz,
>  					  maxlen - sz);
> +		num_features = snap->discard_zeroes_cow + snap->discard_passdown_origin;
> +		if (num_features) {
> +			DMEMIT(" %u", num_features);
> +			if (snap->discard_zeroes_cow)
> +				DMEMIT(" discard_zeroes_cow");
> +			if (snap->discard_passdown_origin)
> +				DMEMIT(" discard_passdown_origin");
> +		}
>  		break;
>  	}
>  }
> @@ -2198,6 +2320,16 @@ static int snapshot_iterate_devices(struct dm_target *ti,
>  	return r;
>  }
>  
> +static void snapshot_io_hints(struct dm_target *ti, struct queue_limits *limits)
> +{
> +	struct dm_snapshot *snap = ti->private;
> +
> +	if (snap->discard_zeroes_cow) {
> +		/* All discards are split on chunk_size boundary */
> +		limits->discard_granularity = snap->store->chunk_size;
> +		limits->max_discard_sectors = snap->store->chunk_size;
> +	}
> +}
>  
>  /*-----------------------------------------------------------------
>   * Origin methods
> @@ -2522,7 +2654,7 @@ static struct target_type origin_target = {
>  
>  static struct target_type snapshot_target = {
>  	.name    = "snapshot",
> -	.version = {1, 15, 0},
> +	.version = {1, 16, 0},
>  	.module  = THIS_MODULE,
>  	.ctr     = snapshot_ctr,
>  	.dtr     = snapshot_dtr,
> @@ -2532,11 +2664,12 @@ static struct target_type snapshot_target = {
>  	.resume  = snapshot_resume,
>  	.status  = snapshot_status,
>  	.iterate_devices = snapshot_iterate_devices,
> +	.io_hints = snapshot_io_hints,
>  };
>  
>  static struct target_type merge_target = {
>  	.name    = dm_snapshot_merge_target_name,
> -	.version = {1, 4, 0},
> +	.version = {1, 5, 0},
>  	.module  = THIS_MODULE,
>  	.ctr     = snapshot_ctr,
>  	.dtr     = snapshot_dtr,
> @@ -2547,6 +2680,7 @@ static struct target_type merge_target = {
>  	.resume  = snapshot_merge_resume,
>  	.status  = snapshot_status,
>  	.iterate_devices = snapshot_iterate_devices,
> +	.io_hints = snapshot_io_hints,
>  };
>  
>  static int __init dm_snapshot_init(void)
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
