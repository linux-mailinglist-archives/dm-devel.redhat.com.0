Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 014AF6703E
	for <lists+dm-devel@lfdr.de>; Fri, 12 Jul 2019 15:40:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6EAEB59464;
	Fri, 12 Jul 2019 13:40:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 259921001B13;
	Fri, 12 Jul 2019 13:40:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3365F206D2;
	Fri, 12 Jul 2019 13:40:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6CDeG9r016970 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 12 Jul 2019 09:40:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D4A5917CDF; Fri, 12 Jul 2019 13:40:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDA2718EE2
	for <dm-devel@redhat.com>; Fri, 12 Jul 2019 13:40:11 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C370A309174E
	for <dm-devel@redhat.com>; Fri, 12 Jul 2019 13:40:09 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p17so10010345wrf.11
	for <dm-devel@redhat.com>; Fri, 12 Jul 2019 06:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=nIAlimFfBGX5MTepH7VtLvREvqaBOHZsmj2pql4QdhY=;
	b=jnnyL19VsqEK2PBK28B71Vlrp4mVkxccxBGsbEyf0e+/vuh6hyNEjoswXemw2i1Bpg
	9FDaZGnZiyV2/owk0tHI/eq0X7YCQ3JWDwMtl0HA/gxFMnRMg4pd294ehSfpPILSsqj3
	N1oRGC6F9G89L63idiDS4fbGJDThthvby154PN8DHst1dIJD/PATzDhc9xih0ieMecBG
	6fhtSnidlYKg6aYjmZQJ5nLh9Xod6N4DivtvGv7wBZUmybKoOpRM4OmHoGgBzfFRiTcv
	aCrxYs9pqPRYI3KbdMfY+TeZBntjTSUkM2NfXYwQfQj+AkN0uV5xGeK3bHq8gb3o4WZ4
	5HFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nIAlimFfBGX5MTepH7VtLvREvqaBOHZsmj2pql4QdhY=;
	b=Uz1QqOWbzxiMVNrDcydOK59r4CNtgl6Eft6WUch/u9ETw7TAgWxesRoGs3uxhDYK1R
	KBWktB3R4/Yc9JGDaAz2014iTzGdlxT2FGZMIEBFjO8Sy4VTNa4DjpSbt4ybbYHy23v7
	bWetdJ3SonrDmVAlD05YU3ae5eWH1SSeLOeiqYUwhLtU56uk9ngjDzZ8/miiiOlhqwuQ
	fl3nf8l0AFUbtoSowCaGh1FF1Ex3JJ1TLQlZCO5hihS9xJgT4Iv+Xj5v9k1LRX5vK7EN
	yB/9cgVtswpaN+sdknp4KNc1g3dI3ka3F91qgCClH3HjyY7zx3L3y0AoaC8AMgr0ddzq
	v38A==
X-Gm-Message-State: APjAAAUnW9C/htnSNZjKaldyZPjqU3kf8sEwnpx1sKgX0Gym53XLbiWu
	KX6EWTtuBlPQ4YSFwNXh0rZFP30j+XU=
X-Google-Smtp-Source: APXvYqyfXP23wj9zgAz8sUEhJ/SStMgoz5kQvxCQhEirIYBi/vfbznCE0rvCM2onAJqE6HCtHGUbBw==
X-Received: by 2002:adf:f851:: with SMTP id d17mr11954123wrq.77.1562938808421; 
	Fri, 12 Jul 2019 06:40:08 -0700 (PDT)
Received: from [10.94.250.118] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	j33sm16234193wre.42.2019.07.12.06.40.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Jul 2019 06:40:07 -0700 (PDT)
To: Mike Snitzer <snitzer@redhat.com>
References: <20190703162504.GA34397@lobo>
	<fb809628-40e3-245a-dda4-034eee9a931b@arrikto.com>
	<20190711203611.GA51041@lobo> <20190711204633.GA51116@lobo>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <321dff9f-a55c-e6ac-4a18-2e9eda0d05fe@arrikto.com>
Date: Fri, 12 Jul 2019 16:40:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190711204633.GA51116@lobo>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 12 Jul 2019 13:40:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Fri, 12 Jul 2019 13:40:10 +0000 (UTC) for IP:'209.85.221.68'
	DOMAIN:'mail-wr1-f68.google.com' HELO:'mail-wr1-f68.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: 1.293 * (DKIM_SIGNED, DKIM_VALID, PDS_NO_HELO_DNS,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.68 mail-wr1-f68.google.com 209.85.221.68
	mail-wr1-f68.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, John Dorminy <jdorminy@redhat.com>
Subject: Re: [dm-devel] [PATCH v2] dm snapshot: add optional discard support
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Fri, 12 Jul 2019 13:40:37 +0000 (UTC)

Hi Mike,

I have reviewed the patch. A few comments below.

On 7/11/19 11:46 PM, Mike Snitzer wrote:
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
>  drivers/md/dm-snap.c                     | 186 +++++++++++++++++++++++++++----
>  2 files changed, 181 insertions(+), 21 deletions(-)
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
> index 3107f2b1988b..63916e1dc569 100644
> --- a/drivers/md/dm-snap.c
> +++ b/drivers/md/dm-snap.c
> @@ -1,6 +1,4 @@
>  /*
> - * dm-snapshot.c
> - *
>   * Copyright (C) 2001-2002 Sistina Software (UK) Limited.
>   *
>   * This file is released under the GPL.
> @@ -134,7 +132,10 @@ struct dm_snapshot {
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
> @@ -1173,12 +1174,64 @@ static void stop_merge(struct dm_snapshot *s)
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
> @@ -1186,8 +1239,8 @@ static int snapshot_ctr(struct dm_target *ti, unsigned int argc, char **argv)
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
> @@ -1204,6 +1257,13 @@ static int snapshot_ctr(struct dm_target *ti, unsigned int argc, char **argv)
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
> @@ -1289,6 +1349,8 @@ static int snapshot_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  
>  	ti->private = s;
>  	ti->num_flush_bios = num_flush_bios;
> +	if (s->discard_zeroes_cow)
> +		ti->num_discard_bios = (s->discard_passdown_origin ? 2 : 1);
>  	ti->per_io_data_size = sizeof(struct dm_snap_tracked_chunk);
>  
>  	/* Add snapshot to the list of snapshots for this origin */
> @@ -1336,29 +1398,22 @@ static int snapshot_ctr(struct dm_target *ti, unsigned int argc, char **argv)
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
> @@ -1806,6 +1861,37 @@ static void remap_exception(struct dm_snapshot *s, struct dm_exception *e,
>  		(bio->bi_iter.bi_sector & s->store->chunk_mask);
>  }
>  
> +static void zero_callback(int read_err, unsigned long write_err, void *context)
> +{
> +	struct bio *bio = context;
> +	struct dm_snapshot *s = bio->bi_private;
> +
> +	up(&s->cow_count);
> +	bio->bi_status = write_err ? BLK_STS_IOERR : 0;
> +	bio_endio(bio);
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
> +	WARN_ON_ONCE(bio->bi_private);
> +	bio->bi_private = s;
> +	dm_kcopyd_zero(s->kcopyd_client, 1, &dest, 0, zero_callback, bio);
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
> @@ -1839,10 +1925,43 @@ static int snapshot_map(struct dm_target *ti, struct bio *bio)
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
Why track_chunk() is needed here?

We track snapshot reads redirected to the origin to ensure that the
origin will not be written while the reads are in-flight, thus returning
corrupted data. Also, we track writes to a merging snapshot, which are
redirected to the COW device, to ensure we don't merge these COW chunks
before the writes finish.

I am probably missing something, but I can't understand why we need to
track the discard to the origin.

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
> +			r = DM_MAPIO_SUBMITTED; /* discard is not issued */
> +			goto out;
> +		}
> +		goto out_unlock;
> +	}
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
> @@ -1890,9 +2009,7 @@ static int snapshot_map(struct dm_target *ti, struct bio *bio)
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
> @@ -2138,6 +2255,7 @@ static void snapshot_status(struct dm_target *ti, status_type_t type,
>  {
>  	unsigned sz = 0;
>  	struct dm_snapshot *snap = ti->private;
> +	unsigned num_features;
>  
>  	switch (type) {
>  	case STATUSTYPE_INFO:
> @@ -2178,8 +2296,16 @@ static void snapshot_status(struct dm_target *ti, status_type_t type,
>  		 * make sense.
>  		 */
>  		DMEMIT("%s %s", snap->origin->name, snap->cow->name);
> -		snap->store->type->status(snap->store, type, result + sz,
> -					  maxlen - sz);
> +		sz += snap->store->type->status(snap->store, type, result + sz,
> +						maxlen - sz);
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
> @@ -2198,6 +2324,22 @@ static int snapshot_iterate_devices(struct dm_target *ti,
>  	return r;
>  }
>  > +static void snapshot_io_hints(struct dm_target *ti, struct queue_limits *limits)
> +{
> +	struct dm_snapshot *snap = ti->private;
> +
> +	if (snap->discard_zeroes_cow) {
> +		struct dm_snapshot *snap_src = NULL, *snap_dest = NULL;
> +

I think the following:

> +		(void) __find_snapshots_sharing_cow(snap, &snap_src, &snap_dest, NULL);
> +		if (snap_src && snap_dest)
> +			snap = snap_src;
> +
> +		/* All discards are split on chunk_size boundary */
> +		limits->discard_granularity = snap->store->chunk_size;
> +		limits->max_discard_sectors = snap->store->chunk_size;

should be:

	down_read(&_origins_lock);

	(void) __find_snapshots_sharing_cow(snap, &snap_src, &snap_dest, NULL);
	if (snap_src && snap_dest)
		snap = snap_src;

	/* All discards are split on chunk_size boundary */
	limits->discard_granularity = snap->store->chunk_size;
	limits->max_discard_sectors = snap->store->chunk_size;

	up_read(&_origins_lock);

Taking _origins_lock protects us against:

	* Concurrent modification of the _origins hash table by
	  register/unregister_snapshot().
	* snapshot_dtr() unregistering snap_src and freeing the relevant
	  resources, e.g., snap_src->store.

> +	}
> +}>  
>  /*-----------------------------------------------------------------
>   * Origin methods
> @@ -2522,7 +2664,7 @@ static struct target_type origin_target = {
>  
>  static struct target_type snapshot_target = {
>  	.name    = "snapshot",
> -	.version = {1, 15, 0},
> +	.version = {1, 16, 0},
>  	.module  = THIS_MODULE,
>  	.ctr     = snapshot_ctr,
>  	.dtr     = snapshot_dtr,
> @@ -2532,11 +2674,12 @@ static struct target_type snapshot_target = {
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
> @@ -2547,6 +2690,7 @@ static struct target_type merge_target = {
>  	.resume  = snapshot_merge_resume,
>  	.status  = snapshot_status,
>  	.iterate_devices = snapshot_iterate_devices,
> +	.io_hints = snapshot_io_hints,
>  };
>  
>  static int __init dm_snapshot_init(void)
> 
One final note. The discard features can also be used by the
snapshot-merge target. But, snapshot_merge_map() is not doing anything
special about discards. They are treated like normal writes.

For chunks that reside in the origin this means that the discard will be
passed down to it using do_origin(). Although this could trigger
exceptions to other snapshots, I think that for the use case these features
are trying to solve there is going to be only one active snapshot. Otherwise,
if we have multiple snapshots, discard_passdown_origin would mean that
discarding one snapshot could affect/corrupt the rest of the snapshots.

For the not-yet-merged, remapped chunks the discard will be redirected to
the COW device, so discard_zeroes_cow is not really zeroing COW in this
case, it is discarding it.

Also, if both discard_zeroes_cow and discard_passdown_origin are enabled,
the relevant chunk, either in origin or in COW, will be discarded twice.

Nikos

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
